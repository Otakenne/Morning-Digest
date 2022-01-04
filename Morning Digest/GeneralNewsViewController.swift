//
//  GeneralNewsViewController.swift
//  Morning Digest
//
//  Created by Otakenne on 31/12/2021.
//

import UIKit

class GeneralNewsViewController: UIViewController {

    @IBOutlet weak var errorLayout: UIView!
    @IBOutlet weak var loadingLayout: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
//    private var viewModel = GeneralNewsViewModel()
    
    var headlineNewsArticles: [NewsArticle] = []
    var latestNewsArticles: [NewsArticle] = []
    var newsRequest: APIRequest<NewsResource>?
    var newsCategory = "General"
    
    var cellScaleWidth = 0.8
    var cellScaleHeight = 0.25
    let d = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDisplay()
        
//        headlineNewsArticles = NewsArticle.getMockNewsArticle()
//        latestNewsArticles = NewsArticle.getMockNewsArticle()

        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaleWidth)
        let cellHeight = floor(screenSize.height * cellScaleHeight)
        let insetX = (screenSize.width - cellWidth) / 2.0
        let insetY = 0.0
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        
//        headlineNewsArticles = viewModel.headlineNews
//        latestNewsArticles = viewModel.latestNews
        
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "newsapi.org"
//        urlComponents.path = "/v2/top-headlines"
//        urlComponents.queryItems = [URLQueryItem(name: "apikey", value: API_KEY),
//                                    URLQueryItem(name: "category", value: "general"),
//                                    URLQueryItem(name: "country", value: "us")] //methodQueries
//        let url = urlComponents.url
//        let session = URLSession.shared
//        let request = URLRequest(url: url!)
//
//        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//                guard error == nil else {
//                    return
//                }
//                guard let data = data else {
//                    return
//                }
//                do {
//                    let decoder = JSONDecoder()
////                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    let response = try decoder.decode(NewsResults.self, from: data)
//                    print(response)
//
//                } catch {
//                    print(error)
//                }
//            })
//            task.resume()
        loadUpStories()
    }
    
    func setupDisplay() {
        errorLayout.isHidden = true
        tableView.isHidden = true
        loadingLayout.isHidden = false
    }
    
    func setupErrorDisplay() {
        errorLayout.isHidden = false
        tableView.isHidden = true
        loadingLayout.isHidden = true
    }
    
    func setupTableDisplay() {
        errorLayout.isHidden = true
        tableView.isHidden = false
        loadingLayout.isHidden = true
    }

    func loadUpStories() {
        let queryParameters = ["apiKey" : API_KEY,
                               "category" : newsCategory,
                               "country" : REGION]
        let resource = NewsResource(queries: queryParameters, path: "/v2/top-headlines")
        let request = APIRequest(resource: resource)
        self.newsRequest = request
        request.execute { [weak self] newsResults in
            if let headline = newsResults?.articles {
                self?.headlineNewsArticles = Array(headline[0...4])
                self?.latestNewsArticles = Array(headline[5...])
                self?.collectionView.reloadData()
                self?.tableView.reloadData()
                self?.setupTableDisplay()
            } else {
                self?.setupErrorDisplay()
            }
        }
    }
}


extension GeneralNewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        headlineNewsArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopHeadlinesCollectionViewCell", for: indexPath) as! TopHeadlinesCollectionViewCell

        let newsArticle = headlineNewsArticles[indexPath.item]

        cell.newsArticle = newsArticle

        return cell
    }
}

extension GeneralNewsViewController: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthWithSpacing = layout.itemSize.width + layout.minimumLineSpacing

        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthWithSpacing

        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWidthWithSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)

        targetContentOffset.pointee = offset
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension GeneralNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        latestNewsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsStoryTableViewCell", for: indexPath) as! NewsStoryTableViewCell
        
        let newsArticle = latestNewsArticles[indexPath.row]
        
        cell.newsArticle = newsArticle
        
        return cell
    }


}

extension GeneralNewsViewController: UITableViewDelegate {

}
