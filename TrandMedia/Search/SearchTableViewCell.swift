//
//  SearchTableViewCell.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieStoryLabel: UILabel!
    
    func configureCell(data: Movie) {
        movieTitleLabel.text = data.movieTitle
        movieDateLabel.text = "\(data.movieRelease) | \(data.movieRuntime)분 | \(data.movieRate)점"
        movieStoryLabel.text = data.movieOverView
        movieStoryLabel.numberOfLines = 3
    }
}
