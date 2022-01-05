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
    var viewControllerArray = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        newsSectionCollectionView!.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        let generalNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GeneralNewsViewController") as! GeneralNewsViewController
        addChild(generalNews)
        generalNews.view.frame = containerView.bounds
        containerView.addSubview(generalNews.view)
        generalNews.didMove(toParent: self)
        viewControllerArray.append(generalNews)
        generalNews.view.isHidden = false
        
        let businessNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BusinessNewsViewController") as! BusinessNewsViewController
        addChild(businessNews)
        businessNews.view.frame = containerView.bounds
        containerView.addSubview(businessNews.view)
        businessNews.didMove(toParent: self)
        viewControllerArray.append(businessNews)
        businessNews.view.isHidden = true
        
        let sportsNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SportsNewsViewController") as! SportsNewsViewController
        addChild(sportsNews)
        sportsNews.view.frame = containerView.bounds
        containerView.addSubview(sportsNews.view)
        sportsNews.didMove(toParent: self)
        viewControllerArray.append(sportsNews)
        sportsNews.view.isHidden = true
        
        let healthNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HealthNewsViewController") as! HealthNewsViewController
        addChild(healthNews)
        healthNews.view.frame = containerView.bounds
        containerView.addSubview(healthNews.view)
        healthNews.didMove(toParent: self)
        viewControllerArray.append(healthNews)
        healthNews.view.isHidden = true
        
        let entertainmentNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EntertainmentNewsViewController") as! EntertainmentNewsViewController
        addChild(entertainmentNews)
        entertainmentNews.view.frame = containerView.bounds
        containerView.addSubview(entertainmentNews.view)
        entertainmentNews.didMove(toParent: self)
        viewControllerArray.append(entertainmentNews)
        entertainmentNews.view.isHidden = true
        
        let scienceNews = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScienceNewsViewController") as! ScienceNewsViewController
        addChild(scienceNews)
        scienceNews.view.frame = containerView.bounds
        containerView.addSubview(scienceNews.view)
        scienceNews.didMove(toParent: self)
        viewControllerArray.append(scienceNews)
        scienceNews.view.isHidden = true
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
        
        for vc in viewControllerArray {
            vc.view.isHidden = true
        }
        
        viewControllerArray[indexPath.item].view.fadeIn()
    }
}
