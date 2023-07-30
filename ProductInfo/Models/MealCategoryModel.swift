//
//  MealCategoryModel.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 26/03/23.
//

import Foundation

struct MealModel: Codable {
    let strCategory: String
}

struct MealCategoryModel: Codable {
    let meals: [MealModel]
}
