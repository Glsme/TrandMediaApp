//
//  ShoppingTableViewCell.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        if likeButton.currentImage == UIImage(systemName: "star") {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        print(#function)
        if checkButton.currentImage == UIImage(systemName: "checkmark.square") {
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    
}
