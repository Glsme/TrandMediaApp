//
//  SearchTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.rowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.movieTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cell.movieDateLabel.font = .systemFont(ofSize: 12, weight: .bold)
        cell.movieStoryLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        return cell
    }
}
