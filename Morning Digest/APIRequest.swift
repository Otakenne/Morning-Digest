//
//  APIRequest.swift
//  Morning Digest
//
//  Created by Otakenne on 03/01/2022.
//

import Foundation
import UIKit

struct Wrapper<T: Decodable>: Decodable {
    let items: [T]
}

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> Resource.ModelType? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let wrapper = try? decoder.decode(Resource.ModelType.self, from: data)
//        print(wrapper)
        return wrapper
    }
    
    func execute(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
            load(resource.url, withCompletion: completion)
    }
}
