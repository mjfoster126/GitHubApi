//
//  ViewController.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 13/12/20.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let tableview = UITableView()
    let commitResults = CommitModelData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.frame
        tableview.register(commitCell.self, forCellReuseIdentifier: "commitCell")
        view.addSubview(tableview)
        
        commitResults.getCommits(user: "mjfoster126", repo: "GitHubApi") { [weak self] in
                    DispatchQueue.main.async {
                        self?.tableview.reloadData()
                    }
                }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "commitCell", for: indexPath) as! commitCell
        
        let row = commitResults.commitRow(index: indexPath.row)
        
        cell.author.text = row?.commit.committer.name
        cell.dateTime.convertDate(dateString: (row?.commit.committer.date)!, date: cell.dateTime)
        cell.sha.text = row?.sha
        cell.commitDescription.text = row?.commit.message
        let url = URL(string: (row?.committer.avatar_url)!)
        cell.userImage.downloaded(from: url!)
        
        return cell
    }
    
    
    
}

