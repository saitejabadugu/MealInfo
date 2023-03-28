//
//  Utility.swift
//  MealInfo
//
//  Created by Keerthi Devipriya(kdp) on 28/03/23.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { 
                    self.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
}
