//
//  SearchTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var movieData: Movie?
    
    var movieList = MovieInfo()
//     ["해리포터", "어벤져스 엔드게임", "웰컴 투 동막골", "스파이더맨 홈커밍"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
//        tableView.rowHeight = 100
    }
    
    @objc func resetButtonClicked() {
        // iOS 13+ SceneDelegate 쓸 때 동작하는 코드
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecoomandCollectionViewController") as! RecoomandCollectionViewController
        
        // 2. 값 전달 - vc가 가지고 있는 프로퍼티에 데이터 추가
        vc.movieTitle = movieList.movie[indexPath.row].movieTitle
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
