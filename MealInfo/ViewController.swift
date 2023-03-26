//
//  ViewController.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 22/03/23.
//

import UIKit

class ViewController: UIViewController {

    var categoryModel: MealCategoryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategoryModel()
    }
    
    func getCategoryModel() {
        Api.getMealCategories { categories in
            self.categoryModel = categories
        }
    }


}

