//
//  RecoomandCollectionViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/// TableView > CollectionView
///  Row > Item

class RecoomandCollectionViewController: UICollectionViewController {
    
    var imageURL = "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220708_75%2F16572722362230AyHS_JPEG%2Fmovie_image.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰의 셀 크기, 셀 사이의 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2 )
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as? RecommandCollectionViewCell else { return UICollectionViewCell() }
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
        
//        cell.posterImageView.backgroundColor = .purple
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.item + 1)번째 셀을 선택했습니다.", duration: 1, position: .center)
    }
}
