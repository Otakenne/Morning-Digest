//
//  TopHeadlinesCollectionViewCell.swift
//  Morning Digest
//
//  Created by Otakenne on 31/12/2021.
//

import UIKit

class TopHeadlinesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var gradientBackground: UIView!
    @IBOutlet weak var newsTitle: UILabel!
    
    var newsArticle: NewsArticle! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        gradientBackground.addGradient()
        if let newsArticle = newsArticle {
            newsTitle.text = newsArticle.title
            if let imageURL = newsArticle.urlToImage {
                backgroundImage.downloaded(from: imageURL)
            }
        } else {
            newsArticle.title = nil
            backgroundImage.image = nil
        }
        
        backgroundImage.layer.masksToBounds = true
    }
}
