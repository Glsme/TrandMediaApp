//
//  ShoppingSettingViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/08/25.
//

import UIKit
import Toast
import Zip

class ShoppingSettingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backupButtonClicked(_ sender: UIButton) {
        print(#function)
     
        var urlPaths = [URL]()
        
        guard let path = documentDirectoryPath() else {
            self.view.makeToast("도큐먼트 위치에 오류가 있어요")
            return
        }
        
        let realmFile = path.appendingPathComponent("default.realm")
        
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            self.view.makeToast("백업할 파일이 없어요")
            return
        }
        
        urlPaths.append(URL(string: realmFile.path)!)
        
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "ShoppingList")
            print("Archive Location: \(zipFilePath)")
            showActivityViewController()
            
        } catch {
            self.view.makeToast("압축을 실패했습니다.")
        }
    }
    
    func showActivityViewController() {
        guard let path = documentDirectoryPath() else {
            self.view.makeToast("도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        let backupFileURL = path.appendingPathComponent("ShoppingList.zip")
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        self.present(vc, animated: true)
    }
    
    @IBAction func restoreButtonClicked(_ sender: UIButton) {
        print(#function)
//
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        self.present(documentPicker, animated: true)
    }
}

extension ShoppingSettingViewController: UIDocumentPickerDelegate {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else {
            self.view.makeToast("선택하신 파일에 오류가 있습니다.")
            return
        }
        
        guard let path = documentDirectoryPath() else {
            self.view.makeToast("도큐먼트 위치에 오류가 있습니다.")
            return
        }
        
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
            let fileURL = path.appendingPathComponent("ShoppingList.zip")
            
            do {
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    
                }, fileOutputHandler: { unzippedFile in
                    self.view.makeToast("복구완료!")
                })
            } catch {
                self.view.makeToast("압축 해제에 실패했습니다.")
            }
        } else {
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                
                let fileURL = path.appendingPathComponent("ShoppingList.zip")
                
                try Zip.unzipFile(fileURL, destination: path, overwrite: true, password: nil, progress: { progress in
                    
                }, fileOutputHandler: { unzippedFile in
                    self.view.makeToast("복구완료!")
                    
                    self.dismiss(animated: true)
                })
            } catch {
                self.view.makeToast("압축 해제에 실패했습니다.")
            }
        }
    }
}
