//
//  SettingViewController.swift
//  Task1
//
//  Created by Jhen Mu on 2021/7/19.
//

import UIKit

class SettingViewController: UIViewController {
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black// 底色
        self.title = "Setting"// 導覽列標題
        self.navigationController?.navigationBar.barTintColor = UIColor.white// 導覽列底色
        self.navigationController?.navigationBar.isTranslucent = false// 導覽列是否半透明

        let myUIView = UIView(frame: CGRect(
          x: 0, y: 0, width: 30, height: 30))// 導覽列右邊 UIView
        myUIView.backgroundColor = UIColor.purple
        let rightButton = UIBarButtonItem(customView: myUIView)// 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton// 建立一個按鈕

        let myButton = UIButton(frame: CGRect(
          x: 100, y: 250, width: 120, height: 40))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
            self,
            action: #selector(SettingViewController.back),
            for: .touchUpInside)
        self.view.addSubview(myButton)

        // Do any additional setup after loading the view.
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
