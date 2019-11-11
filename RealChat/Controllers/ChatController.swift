//
//  ViewController.swift
//  RealChat
//
//  Created by Elbert Rivas on 11/11/2019.
//  Copyright © 2019 Elbert. All rights reserved.
//

import UIKit

class ChatController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
   
    let viewModel = MessageViewModel()
    
    let tableView = UITableView()
    let textEntry = TextEntryView()
    
    var bottomConstraint: NSLayoutConstraint?
    var textEntryHeightConstraint: NSLayoutConstraint?
    
    let cellId = "cellId"
    var isChatToOne = true
    var navTitle: String?
   
    var chatMessageList = [ChatMessage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        initViews()
        setupLayout()
        initVM()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardNotification(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "My Chats"
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
        
        setupData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.removeListener()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ChatBubble
        cell.userId = viewModel.getUserId()!
        cell.chatMessage = chatMessageList[indexPath.item]
        
        return cell
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (textEntry.tvMessage.contentSize.height + 12 < (textEntryHeightConstraint?.constant)!) {
            self.textEntry.tvMessage.isScrollEnabled = false
        } else {
            self.textEntry.tvMessage.isScrollEnabled = true
        }
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textEntry.tvMessage.textColor == .lightGray {
            textEntry.tvMessage.text = nil
            textEntry.tvMessage.textColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1)
        }
        
        // scroll to bottom of tableview
//        if chatMessageList.count != 0 {
//            let indexPath = IndexPath(row: (self.chatMessageList.count) - 1, section: 0)
//            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
//        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textEntry.tvMessage.text?.isEmpty)! {
            textEntry.tvMessage.text = "Write a message"
            textEntry.tvMessage.textColor = .lightGray
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let endFrameY = keyboardFrame?.origin.y ?? 0
            let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
            if endFrameY >= UIScreen.main.bounds.size.height {
                bottomConstraint?.constant = 0
            } else {
                bottomConstraint?.constant = -(keyboardFrame?.size.height)!
            }
            
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.loadViewIfNeeded() },
                           completion: nil)
        }
    }
    
    private func initVM() {
        viewModel.sendMessageClosure = { [weak self] in
            //self.textEntry.tvMessage.text = "Write a message"
            //self.textEntry.tvMessage.textColor = .lightGray
        }
        
        viewModel.reloadTableViewClosure = { [weak self] (chatMessage) in
            self?.chatMessageList.append(chatMessage)
            self?.tableView.beginUpdates()
            let indexPath = IndexPath(row: (self?.chatMessageList.count)! - 1, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .none)
            self?.tableView.endUpdates()
            
            // scroll to bottom
            self?.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
        
        viewModel.openMessage(isChatToOne: self.isChatToOne)
    }
    
    private func setupData() {
        if navTitle != nil {
             self.navigationItem.title = navTitle
        }
    }
    
    func refreshList() {
        self.chatMessageList.removeAll()
        self.tableView.reloadData()
    }
    
    @objc func onSendClicked() {
        let message = textEntry.tvMessage.text
        
        let myId = self.viewModel.getUserId()
        
        if message != "" && textEntry.tvMessage.textColor != .lightGray {
            let chatMessage = ChatMessage(message: message!, name: Constants.name, photoUrl: Constants.photoUrl, userId: myId!, timestamp: [".sv": "timestamp"])

            viewModel.isChatToOne = self.isChatToOne
            viewModel.chatMessage = chatMessage
            
            self.textEntry.tvMessage.text = "Write a message"
            self.textEntry.tvMessage.textColor = .lightGray
        }
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}

