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
    
    let list: [String] = ["하와이 여행을 가고 싶다면?\n수업이 있는데 가실 생각은 아니시죠?","도쿄 여행 예약은?\n XCode로 직접 예약앱을 만들면 되겠네요!"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adBackgroudView.backgroundColor = UIColor(red: .random(in: 0...1),
                                                  green: .random(in: 0...1),
                                                  blue: .random(in: 0...1),
                                                  alpha: .random(in: 0...1))
        
        adBackgroudView.layer.cornerRadius = 10
        adLabel.text = list.randomElement()
    }
    
}
