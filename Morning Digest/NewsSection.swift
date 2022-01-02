//
//  NewsSection.swift
//  Morning Digest
//
//  Created by Otakenne on 31/12/2021.
//

import Foundation

class NewsSection {
    var title: String!
    var isSelected: Bool!
    
    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
    static func loadNewsSection() -> [NewsSection] {
        var newsSections = [NewsSection(title: "General", isSelected: true),
                            NewsSection(title: "Business", isSelected: false),
                            NewsSection(title: "Sports", isSelected: false),
                            NewsSection(title: "Health", isSelected: false),
                            NewsSection(title: "Entertainment", isSelected: false),
                            NewsSection(title: "Science", isSelected: false)]
        
        return newsSections
    }
}
