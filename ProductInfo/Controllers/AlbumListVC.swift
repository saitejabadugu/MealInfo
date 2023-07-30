//
//  AlbumListVC.swift
//  AlbumList
//
//  Created by Keerthi Devipriya(kdp) on 30/07/23.
//

import UIKit

class AlbumListVC: UIViewController {
    
    var infoModel: [Album]?
    var detailModel: Album?
    
    lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "List"
        getAlbumsModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.setUpTableView()
            self.setUpUI()
            self.setUpAutoLayout()
        }
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
    
    func getAlbumsModel() {
        ApiIntegration.getAlbums { categories in
            self.infoModel = categories
        }
    }
}

extension AlbumListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemInfoCell.reuseIdentifier, for: indexPath) as? ItemInfoCell else { return UITableViewCell() }
        let model = infoModel?[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealId = infoModel?[indexPath.row].id ?? 0
        getMealDetail(mealId)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigateToDetailVC()
        }
    }
}

extension AlbumListVC {
    func getMealDetail(_ mealId: Int) {
        self.detailModel = infoModel?.filter {$0.id == mealId}.first
    }
    
    func getMockAlbums() {
        self.infoModel = ApiIntegration.loadJson()
    }
    
    func navigateToDetailVC() {
        let vc = ProductDetailVC()
        vc.detailModel = detailModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
        
