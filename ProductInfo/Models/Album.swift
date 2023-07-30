//
//  Album.swift
//  ProductInfo
//
//  Created by Keerthi Devipriya(kdp) on 30/07/23.
//

import Foundation

struct Album: Codable {
    var albumId: Int
    var id: Int
    var title: String?
    var updatedTitle: String?
    var url: String?
    var thumbnailUrl: String
}
