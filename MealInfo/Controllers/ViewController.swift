//
//  ViewController.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 22/03/23.
//

import UIKit

class ViewController: UIViewController {

    var categoryModel: MealCategoryModel?
    var infoModel: MealInfoModel?
    
    var categoryListTableview: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategoryModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.setUpTableView()
            self.setUpUI()
            self.setupAutoLayout()
        }
    }
    
    func setUpTableView() {
        categoryListTableview.delegate = self
        categoryListTableview.dataSource = self
        categoryListTableview.register(UITableViewCell.self, forCellReuseIdentifier: "categories")

    }
    
    func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(categoryListTableview)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            categoryListTableview.leftAnchor.constraint(equalTo: view.leftAnchor),
            categoryListTableview.rightAnchor.constraint(equalTo: view.rightAnchor),
            categoryListTableview.topAnchor.constraint(equalTo: view.topAnchor),
            categoryListTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

    func getCategoryModel() {
        Api.getMealCategories { categories in
            self.categoryModel = categories
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryModel?.meals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categories", for: indexPath)
        cell.textLabel?.text = categoryModel?.meals[indexPath.row].strCategory
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryModel?.meals[indexPath.row].strCategory ?? ""
        getMealInfo(category)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigativeMealInfo(category)
        }
    }
}

extension ViewController {
    
    func getMealInfo(_ category: String) {
        let infoURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="+category
        Api.getMealInfo(infoURL: infoURL) { meals in
            self.infoModel = meals
        }
    }
    
    func navigativeMealInfo(_ category: String) {
        let vc = MealInfoVC()
        vc.mealCategory = category
        vc.infoModel = self.infoModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
