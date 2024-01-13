//
//  TravelTalkTableViewCell.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/12.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {
    
    static let identifier = "TravelTalkTableViewCell"

    @IBOutlet var chatRoomImage: UIImageView!
    @IBOutlet var chatRoomNameLabel: UILabel!
    @IBOutlet var chatRoomLastMessageLabel: UILabel!
    @IBOutlet var chatRoomDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatRoomImage.backgroundColor = .white
        chatRoomImage.contentMode = .scaleAspectFit
    
        chatRoomNameLabel.font = .boldSystemFont(ofSize: 14)
        
        chatRoomLastMessageLabel.textColor = .gray
        chatRoomLastMessageLabel.font = .systemFont(ofSize: 12)
        
        chatRoomDateLabel.font = .systemFont(ofSize: 10)
        chatRoomDateLabel.textColor = .gray
        
    }
    
    // drawing life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = chatRoomImage.frame.width/2
        chatRoomImage.layer.cornerRadius = radius
    }
    
    func setCell(data: ChatRoom){
     
        chatRoomImage.image = UIImage(named: data.chatroomImage[0])
        chatRoomNameLabel.text = data.chatroomName
        chatRoomLastMessageLabel.text = data.chatList[data.chatList.count-1].message
        chatRoomDateLabel.text = data.chatList[data.chatList.count-1].covertedDate
    }

    
}
