//
//  GeneralNewsViewModel.swift
//  Morning Digest
//
//  Created by Otakenne on 03/01/2022.
//

import Foundation

class GeneralNewsViewModel: ObservableObject {
    @Published private(set) var headlineNews: [NewsArticle] = []
    @Published private(set) var latestNews: [NewsArticle] = []
    @Published private(set) var isLoading = LoadStatus.loading
    
    private var headlineNewsRequest: APIRequest<NewsResource>?
    private var latestNewsRequest: APIRequest<NewsResource>?
    
    init() {
        loadHeadlines()
    }
    
    func loadHeadlines() {
        isLoading = LoadStatus.loading
        let resource = NewsResource(queries: ["apiKey" : API_KEY], path: "/v2/top-headlines")
        let request = APIRequest(resource: resource)
        self.headlineNewsRequest = request
        request.execute { [weak self] newsResults in
            self?.headlineNews = newsResults?.articles ?? []
            self?.loadLatestNews()
        }
    }
}

private extension GeneralNewsViewModel {
    func loadLatestNews() {
        let resource = NewsResource(queries: ["apiKey" : API_KEY], path: "/v2/top-headlines")
        let request = APIRequest(resource: resource)
        self.latestNewsRequest = request
        request.execute { [weak self] newsResults in
            self?.latestNews = newsResults?.articles ?? []
            self?.isLoading = LoadStatus.done
        }
    }
}
