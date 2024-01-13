//
//  OtherChattingTableViewCell.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/13.
//

import UIKit

class OtherChattingTableViewCell: UITableViewCell {

    static let identifier = "OtherChattingTableViewCell"
    
    @IBOutlet var speechBubbleView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userChatLabel: UILabel!
    @IBOutlet var chatTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        speechBubbleView.layer.cornerRadius = 10
        speechBubbleView.layer.borderColor = UIColor.gray.cgColor
        speechBubbleView.layer.borderWidth = 1
        
        profileImageView.backgroundColor = .white
        
        userNameLabel.font = .boldSystemFont(ofSize: 16)
        userChatLabel.font = .systemFont(ofSize: 14)
        chatTimeLabel.font = .systemFont(ofSize: 10)
        chatTimeLabel.textColor = .gray
    }
    
    // drawing life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = profileImageView.frame.width/2
        profileImageView.layer.cornerRadius = radius
    }
    

    func setChattingData(data: ChatRoom, idx: Int){
        
        let item = data.chatList[idx]
        
        profileImageView.image = UIImage(named: item.user.profileImage)
        userNameLabel.text = item.user.rawValue
        userChatLabel.text = item.message
        chatTimeLabel.text = item.covertedTime
        
    }
    
}
