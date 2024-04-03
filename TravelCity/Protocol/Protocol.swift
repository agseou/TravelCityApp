//
//  Protocol.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/15.
//

import UIKit

protocol ReusableProtocol {
    static var identifier: String { get }
}


extension UIViewController: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

