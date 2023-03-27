//
//  MealInfoModel.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 27/03/23.
//

import Foundation

struct MealInfo: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealInfoModel: Codable {
    let meals: [MealInfo]
}
