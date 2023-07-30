//
//  AlbumListVC.swift
//  AlbumList
//
//  Created by Keerthi Devipriya(kdp) on 30/07/23.
//

import UIKit

class AlbumListVC: UIViewController {
    
    var infoModell: [Album]?
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
            self.infoTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        infoTableView.reloadData()
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
            Singleton.sharedInstance.infoModel = categories
            //self.infoModel = categories//Singleton.sharedInstance.infoModel
        }
    }
}

extension AlbumListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.sharedInstance.infoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemInfoCell.reuseIdentifier, for: indexPath) as? ItemInfoCell else { return UITableViewCell() }
        let model = Singleton.sharedInstance.infoModel[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumId = Singleton.sharedInstance.infoModel[indexPath.row].id
        getAlbumDetail(albumId)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.navigateToDetailVC()
        }
    }
}

extension AlbumListVC {
    func getAlbumDetail(_ albumId: Int) {
        self.detailModel = Singleton.sharedInstance.infoModel.filter {$0.id == albumId}.first
    }
    
    func getMockAlbums() {
       // self.infoModel = ApiIntegration.loadJson()
    }
    
    func navigateToDetailVC() {
        let vc = ProductDetailVC()
        vc.delegate = self
        vc.detailModel = detailModel
        self.navigationController?.present(vc, animated: true)
    }
}

extension AlbumListVC: UpdateAlbum {
    func updateTitle(id: Int, title: String) {
        var modifiedobj = Singleton.sharedInstance.infoModel.filter{$0.id == id}.first
        modifiedobj?.title = title
        infoTableView.reloadData()
        print("refreshed")
        //Singleton.sharedInstance.infoModel.filter{$0.id == id}.first = modifiedobj
        //self.infoModel = Singleton.sharedInstance.infoModel
    }
}

class Singleton: NSObject {
    static let sharedInstance = Singleton()
    var infoModel: [Album] = []//ApiIntegration.loadJson()
}
        
