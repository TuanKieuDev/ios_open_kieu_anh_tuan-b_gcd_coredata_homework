//
//  FavouriteViewController.swift
//  GithubFollower
//
//  Created by Tobi on 30/08/2023.
//

import UIKit

final class FavouriteViewController: UIViewController {
    
    @IBOutlet private weak var userTableView: UITableView!
    
    private let users = DatabaseGetter().getUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTableView.delegate = self
        userTableView.dataSource = self
    }
    
    @IBAction private func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(UserTableViewCell.self)
        cell.config(users[indexPath.row])
        
        return cell
    }
}
