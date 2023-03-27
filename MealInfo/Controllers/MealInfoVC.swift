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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = mealCategory
    }
}
