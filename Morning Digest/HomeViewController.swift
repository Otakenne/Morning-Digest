//
//  HomeViewController.swift
//  Morning Digest
//
//  Created by Otakenne on 31/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newsSectionCollectionView: UICollectionView!
    
    var newsSections = NewsSection.loadNewsSection()

    override func viewDidLoad() {
        super.viewDidLoad()

        newsSectionCollectionView!.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        let generalNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GeneralNewsViewController") as! GeneralNewsViewController
        addChild(generalNews)
        generalNews.view.frame = containerView.bounds
        containerView.addSubview(generalNews.view)
        generalNews.didMove(toParent: self)
        generalNews.view.isHidden = false
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsSectionCollectionViewCell", for: indexPath) as! NewsSectionCollectionViewCell
        
        let newsSection = newsSections[indexPath.item]
        
        cell.newsSection = newsSection
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        newsSections.forEach{ $0.isSelected = false }
        newsSections[indexPath.item].isSelected = true
        collectionView.reloadData()
    }
}
