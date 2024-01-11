//
//  ADTableViewCell.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/11.
//

import UIKit

class ADTableViewCell: UITableViewCell {

    @IBOutlet var adBackgroudView: UIView!
    @IBOutlet var adLabel: UILabel!
    
    static let identifier = "ADTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adBackgroudView.backgroundColor = UIColor(red: .random(in: 0...1),
                                                  green: .random(in: 0...1),
                                                  blue: .random(in: 0...1),
                                                  alpha: .random(in: 0...1))
    }
    
}
