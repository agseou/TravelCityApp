//
//  DetailTableViewCell.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/11.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeBtn: UIButton!
    
    static let identifier = "DetailTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .light)
        travelImageView.layer.cornerRadius = 15
        saveLabel.font = .systemFont(ofSize: 14, weight: .light)
        saveLabel.textColor = .gray
       
    }
    

    func setDataCell(data: Travel){
        let url = URL(string: data.travel_image ?? "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788997137138.jpg")
        travelImageView.kf.setImage(with: url)
        travelImageView.contentMode = .scaleAspectFill
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        saveLabel.text = "저장 \(data.save ?? 0)"
       
    }
    


}
