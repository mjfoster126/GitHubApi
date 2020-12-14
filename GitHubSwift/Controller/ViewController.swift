//
//  ViewController.swift
//  GitHubSwift
//
//  Created by Matthew Foster on 13/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    let tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.frame
        tableview.register(commitCell.self, forCellReuseIdentifier: "commitCell")
        view.addSubview(tableview)
    }


}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "commitCell", for: indexPath) as! commitCell
        
        cell.author.text = "Text"
        cell.dateTime.text = "13th Dec 2020"
        cell.sha.text = "35fdc750232d9af45ffd9c657ab0db6e800c3a9d"
        cell.commitDescription.text = "This is where the description will go so that it can be viewed."
        return cell
    }
    
    
    
}

