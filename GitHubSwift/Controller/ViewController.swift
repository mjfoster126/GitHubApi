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
    var commits = [CommitObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = view.frame
        tableview.register(commitCell.self, forCellReuseIdentifier: "commitCell")
        view.addSubview(tableview)
        
        let urlString = "https://api.github.com/repos/mjfoster126/GitHubApi/commits"
        
           guard let url = URL(string: urlString) else{
               return
           }

         
           URLSession.shared.dataTask(with: url) { (data, res, err) in
                
               guard let data = data else {
                     return
               }

               do {
                self.parse(json: data)
             
               } catch {
                   print("didnt work")
               }

           }.resume()
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
         
            do {
                self.commits = try decoder.decode([CommitObject].self, from: json)
                DispatchQueue.main.async {
                self.tableview.reloadData()
                }
         
            } catch {
                print(error)
            }
     
    }

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "commitCell", for: indexPath) as! commitCell
        
        let row = commits[indexPath.row]
        cell.author.text = row.commit.author.name
        cell.dateTime.text = row.commit.committer.date
        cell.sha.text = row.sha
        cell.commitDescription.text = row.commit.message
        return cell
    }
    
    
    
}

