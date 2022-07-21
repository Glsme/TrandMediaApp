//
//  TrendTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func movieButtonClicked(_ sender: UIButton) {
        //화면전환: 1. 스토리보드 파일 2. 스토리보드 내에 뷰 컨트롤러 3. 화면 전환
        // 영화 버튼 클릭 -> BucketListTableViewController present
        // 1.
        let storyBoard = UIStoryboard(name: "Trend", bundle: nil)
        //2
        let vc = storyBoard.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        //3
        self.present(vc, animated: true)
    }
    
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        // 1.
        let storyBoard = UIStoryboard(name: "Trend", bundle: nil)
        //2
        let vc = storyBoard.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        
        //2.5
        vc.modalPresentationStyle = .fullScreen
        //3
        self.present(vc, animated: true)
    }
    
    @IBAction func bookButtonClicked(_ sender: UIButton) {
        // 1.
        let storyBoard = UIStoryboard(name: "Trend", bundle: nil)
        //2
        let vc = storyBoard.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        //2.5
        navigationController.modalPresentationStyle = .fullScreen
        //3
        self.present(navigationController, animated: true)
    }
    
}
