//
//  NewsStoryTableViewCell.swift
//  Morning Digest
//
//  Created by Otakenne on 01/01/2022.
//

import Foundation
import UIKit

class NewsStoryTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var author: UILabel!
    
    var newsArticle: NewsArticle! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        if let newsArticle = newsArticle {
            newsTitle.text = newsArticle.title
            author.text = newsArticle.source?.name
            if let imageURL = newsArticle.urlToImage {
                newsImage.downloaded(from: imageURL)
            }
        } else {
            newsTitle.text = nil
            author.text = nil
            newsImage.image = nil
        }
    }
}
