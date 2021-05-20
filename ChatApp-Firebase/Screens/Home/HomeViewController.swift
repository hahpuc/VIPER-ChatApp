//
//  HomeViewController.swift
//  ChatApp-Firebase
//
//  Created by Long Nguyễn on 18/05/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController, HomeViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol?
    var users: [User] = [] {
        didSet {
            presenter?.viewDidLoad()
        }
    }
    var lastestMessages: [String: ChatMessage] = [:]
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        self.title = Auth.auth().currentUser?.email
        
        tableView.delegate = self
        tableView.dataSource = self
        self.registerTableViewCells()
        
        HomeRouter.homeStart(homeRef: self)
        presenter?.viewDidLoad()
    }
    
    func showUserList(with users: [User]) {
        self.users = users
    
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLastestMessage(lastestMessages: [String : ChatMessage]) {
        self.lastestMessages = lastestMessages
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func registerTableViewCells() {
        let cell = UINib(nibName: "HomeLastestMessageCell", bundle: nil)
        
        self.tableView.register(cell, forCellReuseIdentifier: "HomeLastestMessageCell")
    }
    
    @IBAction func handleLogOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.pushUserToChatLogsScreen(with: users[indexPath.row], from: self)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeLastestMessageCell", for: indexPath) as! HomeLastestMessageCell
    
        cell.setUserName(users[indexPath.row].username)
        
        let uidAtIndexpath = users[indexPath.row].uid ?? ""
        
        let message = lastestMessages[uidAtIndexpath]?.text
        
        cell.setLastestMEssage(message ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
