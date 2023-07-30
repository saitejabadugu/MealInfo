//
//  ProductDetailVC.swift
//  ProductInfo
//
//  Created by Keerthi Devipriya(kdp) on 30/07/23.
//

import UIKit

protocol UpdateAlbum: AnyObject {
    func updateTitle(id: Int, title: String)
}

class ProductDetailVC: UIViewController {
    
    var detailModel: Album?
    weak var delegate: UpdateAlbum?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = true
        view.isScrollEnabled = true
        return view
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 16
        return view
    }()
    
    lazy var mealImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var mealNameLabel: UILabel = {
        let infolabel = UILabel()
        infolabel.translatesAutoresizingMaskIntoConstraints = false
        infolabel.numberOfLines = 2
        infolabel.text = "text"
        return infolabel
    }()
    
    lazy var categoryLabel: UITextField = {
        let infolabel = UITextField()
        infolabel.placeholder = "Update the title"
        infolabel.translatesAutoresizingMaskIntoConstraints = false
        return infolabel
    }()
    
    
    lazy var updateTitleBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.text = "text"
        btn.backgroundColor = .black
        btn.titleLabel?.textColor = .white
        btn.addTarget(nil, action: #selector(navigateBackToList), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.setUpdata()
            self.setUpUI()
            self.setUpAutoLayout()
        }
    }
    
    func setUpdata() {
        let img = detailModel?.thumbnailUrl ?? ""
        mealImgView.imageFromUrl(urlString: img)
        let mealName = detailModel?.title
        mealNameLabel.text = mealName
        updateTitleBtn.setTitle("UpdateTitle", for: .normal)
    }
    
    func setUpUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(mealImgView)
        scrollViewContainer.addArrangedSubview(mealNameLabel)
        scrollViewContainer.addArrangedSubview(categoryLabel)
        scrollViewContainer.addArrangedSubview(updateTitleBtn)
    }
    
    func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            mealImgView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 86),
            mealImgView.heightAnchor.constraint(equalToConstant: 120),
            mealImgView.widthAnchor.constraint(equalToConstant: 180),
            mealImgView.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),

            categoryLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 16),
            categoryLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -16),
            mealNameLabel.topAnchor.constraint(equalTo: mealImgView.bottomAnchor, constant: 16),
            
            categoryLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 16),
            categoryLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -16),
            categoryLabel.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 16),
            
            updateTitleBtn.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 16),
            updateTitleBtn.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -16),
            updateTitleBtn.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 16),
            updateTitleBtn.heightAnchor.constraint(equalTo: categoryLabel.heightAnchor, constant: 32),

        ])
    }
    
    @objc func navigateBackToList() {
        if categoryLabel.text != String() {
            self.dismiss(animated: true) {
                self.delegate?.updateTitle(id: self.detailModel?.id ?? 0, title: self.categoryLabel.text ?? String())
            }
        } else {
            let alertVc = UIAlertController(title: "Oops!", message: "You haven't updated title", preferredStyle: .alert)
            alertVc.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alertAction) in
                self.dismiss(animated: true)
            }))
            self.present(alertVc, animated: true)
        }
    }
    
    
}
