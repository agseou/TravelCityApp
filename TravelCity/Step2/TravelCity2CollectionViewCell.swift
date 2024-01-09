//
//  TravelCity2CollectionViewCell.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit

class TravelCity2CollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityKorNameLabel: UILabel!
    @IBOutlet var cityEngNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cityKorNameLabel.font = .boldSystemFont(ofSize: 17)
        cityEngNameLabel.font = .boldSystemFont(ofSize: 17)
        
        // cityExplainLabel
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.textColor = .darkGray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.font = .systemFont(ofSize: 13)
    }
    
    // drawing life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius = cityImageView.frame.width/2
        cityImageView.layer.cornerRadius = radius
    }
//    override func layoutIfNeeded() {
//        //code
//    }
    
    //cityImageView
    func setCityImageView(data: City){
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
        
        print(cityImageView.frame.width, cityImageView.frame.height)
       
    }
    

    // cityKorNameLabel & cityEngNameLabel
    func setCityLabel(data: City){
        cityKorNameLabel.text = data.city_name
        cityEngNameLabel.text = data.city_english_name
        cityExplainLabel.text = data.city_explain
    }
    
}
