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
    
//    enum CodingKeys: String, CodingKey {
//        case a = "user_first_name"
//        case lastName = "user_last_name"
//        case age
//    }
    
    static func getMockNewsArticle() -> [NewsArticle] {
        let newsArticle = NewsArticle(source: Source(id: "bbc", name: "BBC"), author: "BBC", title: "NBA finals: Warriors blow a 3 - 1 lead against the Cavs in the 2016 NBA finals", description: "Description", url: "", urlToImage: "https://www.chathamhouse.org/sites/default/files/styles/12_6_media_huge/public/2021-09/GettyImages-1320354900.jpg?h=d3ce0c2e&itok=PzxNx2pl", publishedAt: "", content: "")
        return [newsArticle, newsArticle, newsArticle, newsArticle, newsArticle]
    }
}

//extension NewsArticle: Codable {
//
//}

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
