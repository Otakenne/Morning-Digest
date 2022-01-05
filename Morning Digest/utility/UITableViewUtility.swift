//
//  UITableViewUtility.swift
//  Morning Digest
//
//  Created by Otakenne on 05/01/2022.
//

import UIKit

extension UITableView {
    
    /// This method returns the indexPath of the cell that contains the specified view
    /// - parameter view: The view to find.
    /// - returns: The indexPath of the cell containing the view, or nil if it can't be found
    
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let origin = view.bounds.origin
        let viewOrigin = self.convert(origin, from: view)
        let indexPath = self.indexPathForRow(at: viewOrigin)
        return indexPath
    }
}
