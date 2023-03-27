//
//  MealInfoVC.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 27/03/23.
//

import UIKit

class MealInfoVC: UIViewController {
    
    var mealCategory: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = mealCategory
    }
}
