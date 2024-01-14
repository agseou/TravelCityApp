//
//  ChattingViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/12.
//

import UIKit

class ChattingViewController: UIViewController {

    static let identifier = "ChattingViewController"
    
    var chattings: ChatRoom = ChatRoom(chatroomId: 1, chatroomImage: [User.hue.profileImage], chatroomName: "도봉 멘토방")
    
    @IBOutlet var footerView: UIView!
    @IBOutlet var chatTextField: UITextView!
    @IBOutlet var chatTextFieldBackView: UIView!
    @IBOutlet var chattingTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // xib -> register
        let xib = UINib(nibName: OtherChattingTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: MyChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(xib, forCellReuseIdentifier: OtherChattingTableViewCell.identifier)
        chattingTableView.register(xib2, forCellReuseIdentifier: MyChattingTableViewCell.identifier)
        
        // delegate와 dataSource 등록
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        chatTextField.delegate = self
        chattingTableView.separatorStyle = .none
        
        //automatic Dimension
        chattingTableView.rowHeight = UITableView.automaticDimension
        
        // 채팅 가장 마지막으로 내기리
        let index = IndexPath(row: chattings.chatList.count-1, section: 0)
        chattingTableView.scrollToRow(at: index, at: .bottom, animated: true)
        
        // navigation title 부여
        navigationItem.title = chattings.chatroomName
        
        chatTextFieldBackView.backgroundColor = .systemGray6
        chatTextFieldBackView.layer.cornerRadius = 10
        chatTextField.textColor = .gray
        chatTextField.backgroundColor = .clear
        chatTextField.text = "메세지를 입력하세요"
        
    }
    
    @IBAction func tapSendBtn(_ sender: UIButton) {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let formattedDate = dateFormatter.string(from: date)
 
        
        chattings.chatList.append(Chat(user: .user, date: formattedDate, message: chatTextField.text))
        chattingTableView.reloadData()
        chatTextField.textColor = .gray
        chatTextField.text = "메세지를 입력하세요"
        
        let index = IndexPath(row: chattings.chatList.count-1, section: 0)
        chattingTableView.scrollToRow(at: index, at: .bottom, animated: true)
    }
    
}

extension ChattingViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "메세지를 입력하세요" {
            textView.textColor = .black
            chatTextField.text = nil
        }
    }
    
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 행의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattings.chatList.count
    }
    
    // 행의 컨텐츠
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if chattings.chatList[indexPath.row].user == .user{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MyChattingTableViewCell.identifier, for: indexPath) as! MyChattingTableViewCell
            
            cell.setChattingData(data: chattings, idx: indexPath.row)
            cell.selectionStyle = .none
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: OtherChattingTableViewCell.identifier, for: indexPath) as! OtherChattingTableViewCell
            
            cell.setChattingData(data: chattings, idx: indexPath.row)
            cell.selectionStyle = .none
            
            return cell
        }
    }
 
}
