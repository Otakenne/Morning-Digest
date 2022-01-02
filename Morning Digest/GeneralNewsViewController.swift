//
//  GeneralNewsViewController.swift
//  Morning Digest
//
//  Created by Otakenne on 31/12/2021.
//

import UIKit

class GeneralNewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    let newsArticles = NewsArticle.getMockNewsArticle()
    var cellScaleWidth = 0.8
    var cellScaleHeight = 0.25
    let d = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaleWidth)
        let cellHeight = floor(screenSize.height * cellScaleHeight)
        let insetX = (screenSize.width - cellWidth) / 2.0
        let insetY = 0.0
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
}

extension GeneralNewsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsArticles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopHeadlinesCollectionViewCell", for: indexPath) as! TopHeadlinesCollectionViewCell
        
        let newsArticle = newsArticles[indexPath.item]
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}

extension GeneralNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsStoryTableViewCell", for: indexPath) as! NewsStoryTableViewCell
        
        let newsArticle = newsArticles[indexPath.row]
        
        cell.newsArticle = newsArticle
        
        return cell
    }


}

extension GeneralNewsViewController: UITableViewDelegate {

}
