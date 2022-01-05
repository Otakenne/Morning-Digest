//
//  NewsResource.swift
//  Morning Digest
//
//  Created by Otakenne on 03/01/2022.
//

import Foundation

struct NewsResource: APIResource {
    typealias ModelType = NewsResults
    
    var queries: [String : String]!
    var path: String!
    
    var methodQueries: [URLQueryItem] {
        var queryList = [URLQueryItem]()
        for (key, value) in queries {
            queryList.append(URLQueryItem(name: key, value: value))
        }
        return queryList
    }
    
    var methodPath: String {
        path
    }
}
