//
//  TravelCity1CollectionViewCell.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit
import Kingfisher

class TravelCity1CollectionViewCell: UICollectionViewCell {
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityKorNameLabel: UILabel!
    @IBOutlet var cityEngNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityKorNameLabel.font = .boldSystemFont(ofSize: 16)
        cityEngNameLabel.font = .boldSystemFont(ofSize: 16)
        
        // cityExplainLabel
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.textColor = .darkGray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.font = .systemFont(ofSize: 14)
    }
    
    //cityImageView
    func setCityImageView(data: City){
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 80
    }
    

    // cityKorNameLabel & cityEngNameLabel
    func setCityLabel(data: City){
        cityKorNameLabel.text = data.city_name
        cityEngNameLabel.text = data.city_english_name
        cityExplainLabel.text = data.city_explain
    }
    
    
}
