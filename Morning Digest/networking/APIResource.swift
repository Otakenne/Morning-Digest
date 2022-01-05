//
//  APIResource.swift
//  Morning Digest
//
//  Created by Otakenne on 03/01/2022.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Codable
    var methodPath: String { get }
    var methodQueries: [URLQueryItem] { get }
}

extension APIResource {
    var url: URL! {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = methodPath
        urlComponents.queryItems = methodQueries //[URLQueryItem(name: "apikey", value: API_KEY),
                                    //URLQueryItem(name: "category", value: "general"),
                                    //URLQueryItem(name: "country", value: "us")] //
        let url = urlComponents.url
//        print(url)
        return url
    }
}
