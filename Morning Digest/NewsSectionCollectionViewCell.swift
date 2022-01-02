//
//  NewsSectionCollectionViewCell.swift
//  Morning Digest
//
//  Created by Otakenne on 31/12/2021.
//

import UIKit

class NewsSectionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newsSectionLabel: UILabel!
    
    var newsSection: NewsSection! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let newsSection = newsSection {
            newsSectionLabel.text = newsSection.title
            if (newsSection.isSelected) {
                newsSectionLabel.font = UIFont.boldSystemFont(ofSize: 27.0)
                newsSectionLabel.textColor = .black
            } else {
                newsSectionLabel.font = UIFont.systemFont(ofSize: 27.0)
                newsSectionLabel.textColor = .darkGray
            }
        } else {
            newsSectionLabel.text = nil
        }
    }
}
