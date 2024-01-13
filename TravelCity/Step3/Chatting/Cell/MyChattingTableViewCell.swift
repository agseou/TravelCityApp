//
//  MyChattingTableViewCell.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/13.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell {

    static let identifier = "MyChattingTableViewCell"
    
    @IBOutlet var speechBubbleView: UIView!
    @IBOutlet var userChatLabel: UILabel!
    @IBOutlet var chatTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        speechBubbleView.layer.cornerRadius = 10
        speechBubbleView.layer.borderColor = UIColor.gray.cgColor
        speechBubbleView.layer.borderWidth = 1
        speechBubbleView.backgroundColor = .systemGray6
        
        userChatLabel.font = .systemFont(ofSize: 14)
        chatTimeLabel.font = .systemFont(ofSize: 10)
        chatTimeLabel.textColor = .gray
        
    }
    
    func setChattingData(data: ChatRoom, idx: Int){
        
        let item = data.chatList[idx]
        userChatLabel.text = item.message
        chatTimeLabel.text = item.covertedTime
    }

}
