//
//  MealInfoVC.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 27/03/23.
//

import UIKit

class MealInfoVC: UIViewController {
    
    var mealCategory: String?
    var infoModel: MealInfoModel?
    var detailModel: MealDetailModel?
    
    lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = mealCategory
        setUpTableView()
        setUpUI()
        setUpAutoLayout()
    }
    
    func setUpUI() {
        view.addSubview(infoTableView)
    }
    
    func setUpTableView() {
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(ItemInfoCell.self, forCellReuseIdentifier: ItemInfoCell.reuseIdentifier)
    }
    
    func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            infoTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            infoTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            infoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MealInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoModel?.meals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemInfoCell.reuseIdentifier, for: indexPath) as? ItemInfoCell else { return UITableViewCell() }
        let model = infoModel?.meals[indexPath.row]
        cell.configure(model: model)
        //cell.textLabel?.text = infoModel?.meals[indexPath.row]//.strMeal
        //cell.imageView?.image = UIImage(named: "defaultIcon")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealId = infoModel?.meals[indexPath.row].idMeal ?? ""
        getMealDetail(mealId)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigateToDetailVC()
        }
    }
        
}

extension MealInfoVC {
    
    
    func getMealDetail(_ mealId: String) {
       let detailUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + mealId
        Api.getMealDetail(detailURL: detailUrl) { details in
            self.detailModel = details
        }
    }
    
    
    func navigateToDetailVC() {
        let vc = MealDetailVC()
        vc.detailModel = detailModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
        
