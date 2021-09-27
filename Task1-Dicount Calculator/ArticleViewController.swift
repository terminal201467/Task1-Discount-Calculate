//
//  ArticleViewController.swift
//  Task1
//
//  Created by Jhen Mu on 2021/7/19.
//

import UIKit

class ArticleViewController: UIViewController {
    
    @objc func edit() {
        print("edit action")
    }

    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white // 底色
        self.title = "Article" // 導覽列標題
        self.navigationController?.navigationBar.barTintColor = UIColor.cyan // 導覽列底色
        self.navigationController?.navigationBar.isTranslucent = false // 導覽列是否半透明
        
        let rightButton = UIBarButtonItem(
            barButtonSystemItem: .edit,
          target: self,
          action: #selector(ArticleViewController.edit))// 導覽列右邊按鈕
        self.navigationItem.rightBarButtonItem = rightButton // 加到導覽列中

        let myButton = UIButton(frame: CGRect(
          x: 100, y: 100, width: 120, height: 40))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
            self,
            action: #selector(ArticleViewController.back),
            for: .touchUpInside)  // 建立一個按鈕
        self.view.addSubview(myButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
