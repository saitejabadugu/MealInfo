//
//  MealDetailVC.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 28/03/23.
//

import UIKit

class MealDetailVC: UIViewController {
    
    var detailModel: MealDetailModel?
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var detailImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
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
        setUpUI()
        setUpdata()
        setUpAutoLayout()
        view.backgroundColor = .white
    }
    
    func setUpdata() {
        mealNameLabel.text = detailModel?.meals.first?.strMeal
        categoryLabel.text = detailModel?.meals.first?.strCategory
        areaLabel.text = detailModel?.meals.first?.strArea
        instructionsLabel.text = detailModel?.meals.first?.strInstructions
        tagsLabel.text = detailModel?.meals.first?.strTags
    }
    
    func setUpUI() {
        contentView.addSubview(mealNameLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(areaLabel)
        contentView.addSubview(instructionsLabel)
        contentView.addSubview(tagsLabel)
        view.addSubview(contentView)
    }
    
    func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mealNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            mealNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            mealNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 144),
            
            categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            categoryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            categoryLabel.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 16),
            
            areaLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            areaLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            areaLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 16),
            
            instructionsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            instructionsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            instructionsLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 16),
            
            tagsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            tagsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            tagsLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 16),
        ])
    }
    
}
