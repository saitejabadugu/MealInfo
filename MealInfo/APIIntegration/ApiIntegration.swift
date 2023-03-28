//
//  ApiIntegration.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 26/03/23.
//

import Foundation

class Api {
    static func getMealCategories(completion: @escaping(MealCategoryModel) -> Void) {
        let categoryUrl = "https://www.themealdb.com/api/json/v1/1/list.php?c=list"
        let url = URL(string: categoryUrl)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Got Errror -----\(error)")
                return
            }
            
            if let data = data,
                let mealData = try? JSONDecoder().decode(MealCategoryModel.self, from:  data) {
                completion(mealData)
            }
        })
        task.resume()
    }
    
    static func getMealInfo(infoURL: String,completion: @escaping(MealInfoModel) -> Void) {
        let url = URL(string: infoURL)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Got error -----\(error)")
                return
            }
            
            if let data = data,
               let mealInfo = try? JSONDecoder().decode(MealInfoModel.self, from: data) {
                completion(mealInfo)
            }
        })
        task.resume()
    }
    
    static func getMealDetail(detailURL: String,completion: @escaping(MealDetailModel) -> Void) {
        let url = URL(string: detailURL)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Got error -----\(error)")
                return
            }
            
            if let data = data,
               let mealDetail = try? JSONDecoder().decode(MealDetailModel.self, from: data) {
                print("data is---\(mealDetail)")
                completion(mealDetail)
            }
        })
        task.resume()
    }
}
