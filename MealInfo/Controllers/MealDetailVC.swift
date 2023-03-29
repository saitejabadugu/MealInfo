//
//  MealDetailVC.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 28/03/23.
//

import UIKit

class MealDetailVC: UIViewController {
    
    var detailModel: MealDetailModel?
    
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
        infolabel.text = "text"
        return infolabel
    }()
    
    lazy var categoryLabel: UILabel = {
        let infolabel = UILabel()
        infolabel.translatesAutoresizingMaskIntoConstraints = false
        infolabel.text = "text"
        return infolabel
    }()
    
    lazy var areaLabel: UILabel = {
        let infolabel = UILabel()
        infolabel.translatesAutoresizingMaskIntoConstraints = false
        infolabel.text = "text"
        return infolabel
    }()
    
    lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tagsLabel: UILabel = {
        let infolabel = UILabel()
        infolabel.translatesAutoresizingMaskIntoConstraints = false
        infolabel.text = "text"
        return infolabel
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
        let img = detailModel?.meals.first?.strMealThumb ?? ""
        mealImgView.imageFromUrl(urlString: img)
        mealNameLabel.text = detailModel?.meals.first?.strMeal
        categoryLabel.text = detailModel?.meals.first?.strCategory
        areaLabel.text = detailModel?.meals.first?.strArea
        instructionsLabel.text = detailModel?.meals.first?.strInstructions
        tagsLabel.text = detailModel?.meals.first?.strTags
    }
    
    func setUpUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(mealImgView)
        scrollViewContainer.addArrangedSubview(mealNameLabel)
        scrollViewContainer.addArrangedSubview(categoryLabel)
        scrollViewContainer.addArrangedSubview(areaLabel)
        scrollViewContainer.addArrangedSubview(instructionsLabel)
        scrollViewContainer.addArrangedSubview(tagsLabel)

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
            
            areaLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 16),
            areaLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -16),
            areaLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 16),
            
            instructionsLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 16),
            instructionsLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -16),
            instructionsLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 16),
            
            tagsLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 16),
            tagsLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -16),
            tagsLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 16),
        ])
    }
    
}
