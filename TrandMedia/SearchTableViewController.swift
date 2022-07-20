//
//  SearchTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var movieList = MovieInfo()
//     ["해리포터", "어벤져스 엔드게임", "웰컴 투 동막골", "스파이더맨 홈커밍"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.rowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let data = movieList.movie[indexPath.row]
        cell.configureCell(data: data)
        cell.movieTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cell.movieDateLabel.font = .systemFont(ofSize: 12, weight: .bold)
        cell.movieStoryLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        return cell
    }
}
