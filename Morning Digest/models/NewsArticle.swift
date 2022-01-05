//
//  NewsArticle.swift
//  Morning Digest
//
//  Created by Otakenne on 31/12/2021.
//

import Foundation

struct NewsResults: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsArticle]?
}

struct NewsArticle: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}

//extension Source: Codable {
//    enum CodingKeys: String, CodingKey {
//       case id = "id"
//       case name = "name"
//   }
//}
