//
//  ViewController.swift
//  Practice
//
//  Created by Jhen Mu on 2021/7/15.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    // MARK: - properties
    let fullScreenSize = UIScreen.main.bounds.size
    var theSlider :UISlider!//滑桿屬性
    var percentLabel:UILabel!
    var priceLabel:UILabel!//實際價格
    var theLabel:UILabel! //打折價格純文字
    var discountLabel:UILabel! //打折文字
    var discountPrice:UILabel! //打折價錢
    var discount:UILabel!//打折趴數
    var theTextField:UITextField!//輸入畫面
    var theTitle:UILabel!
    var theSwitch:UISwitch!
    var theDarkMode:UILabel!
    
    var discountPercent:Int = 0
    var countPrice:Int = 0
    var realPrice:Int = 0
    var thePrice:Int = 0
    
    //方法一：拉動滑桿會帶動打折
    @objc func onSliderChange(number:UISlider) {
        view.endEditing(true)
        //滑桿
        discountPercent = Int(theSlider.value.rounded()) //打折趴數，轉換為Int
        thePrice = Int(theTextField.text!) ?? Int(0) //輸入的價錢，轉換為Int
        countPrice = Int(discountPercent * thePrice / 100)//轉換為百分率，乘上折抵的錢
        realPrice = thePrice - Int(countPrice) //經折抵後的價錢 有東西
        //轉換到標籤上
        discount.text = String(discountPercent)+"%" //打折趴數
        discountPrice.text = String(countPrice) //轉換折扣多少錢
        priceLabel.text = String(realPrice)//轉換實價
        }
    
    @objc func onChange(sender: AnyObject) {
        // 取得這個 UISwtich 元件
        let tempSwitch = sender as! UISwitch

        // 依據屬性 on 來為底色變色
        if tempSwitch.isOn {
            self.view.backgroundColor =
                UIColor.black
        } else {
            self.view.backgroundColor =
                UIColor.white
        }
    }
    
    @objc func article() {
        self.navigationController?.pushViewController(
          ArticleViewController(), animated: true)
    }

    @objc func check() {
        print("check button action")
    }

    @objc func setting() {
        self.navigationController?.pushViewController(
          SettingViewController(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//NavigationBar
        self.view.backgroundColor = UIColor.darkGray
        self.title = "首頁"// 導覽列標題
        self.navigationController?.navigationBar.barTintColor =
            UIColor.lightGray// 導覽列底色
        self.navigationController?.navigationBar.isTranslucent = false// 導覽列是否半透明
        let leftButton = UIBarButtonItem(
          image: UIImage(named:"check"),
            style:.plain ,
          target:self ,
          action: #selector(ViewController.check))// 導覽列左邊按鈕
        self.navigationItem.leftBarButtonItem = leftButton// 加到導覽列中
        let rightButton = UIBarButtonItem(
          title:"設定",
            style:.plain,
          target:self,
          action:#selector(ViewController.setting))// 導覽列右邊按鈕
        self.navigationItem.rightBarButtonItem = rightButton // 加到導覽列中
        let myButton = UIButton(frame: CGRect(
          x: 0, y: 0, width: 120, height: 40))// 建立一個按鈕
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
            self,
            action: #selector(ViewController.article),
            for: .touchUpInside)
        self.view.addSubview(myButton)
        
        
//最上面的顯示標題"Discount Calculator"
        theTitle = UILabel()
        theTitle.translatesAutoresizingMaskIntoConstraints = false
        theTitle.text = "Discount Calculator"
        theTitle.textColor = UIColor.black
        theTitle.font = UIFont(name: "Helvetica-Light", size: 20)
        theTitle.font = UIFont.systemFont(ofSize: 10)
        theTitle.textAlignment = .right
        self.view.addSubview(theTitle)
        
//價錢輸入框
        theTextField = UITextField()
        theTextField.translatesAutoresizingMaskIntoConstraints = false
        theTextField.placeholder = "$"
        theTextField.textAlignment = .right
        theTextField.font = UIFont(name: "Helvetica-Light", size: 30)
        theTextField.borderStyle = .roundedRect
        theTextField.textColor = UIColor.black
        theTextField.backgroundColor = UIColor.white
        //鍵盤
        theTextField.delegate = self //啟用協定
        theTextField.keyboardType = .numberPad
        theTextField.clearButtonMode = .whileEditing
        theTextField.returnKeyType = .default
        theTextField.resignFirstResponder()
        self.view.addSubview(theTextField)
//輸入框下面的文字：打折
        discountLabel = UILabel()
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.text = "打折:"
        discountLabel.textColor = UIColor.gray
        discountLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        discountLabel.font = discountLabel.font.withSize(5)
        discountLabel.font = UIFont.systemFont(ofSize: 12)
        discountLabel.textAlignment = NSTextAlignment.right
        discountLabel.textAlignment = .center
        self.view.addSubview(discountLabel)
        
//打折折數
        discount = UILabel()
        discount.translatesAutoresizingMaskIntoConstraints = false
        discount.textColor = UIColor.gray
        discount.font = UIFont(name: "Helvetica-Light", size: 20)
        discount.font = discountLabel.font.withSize(5)
        discount.font = UIFont.systemFont(ofSize: 12)
        discount.textAlignment = NSTextAlignment.right
        discount.textAlignment = .center
        self.view.addSubview(discount)
//輸入框下面的文字：打折後價格
        theLabel = UILabel()
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        theLabel.text = "打折後價格"
        theLabel.textColor = UIColor.gray
        theLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        theLabel.font = theLabel.font.withSize(5)
        theLabel.font = UIFont.systemFont(ofSize: 12)
        theLabel.textAlignment = NSTextAlignment.right
        theLabel.textAlignment = .center
        self.view.addSubview(theLabel)
//折扣價
        discountPrice = UILabel()
        discountPrice.translatesAutoresizingMaskIntoConstraints = false
        discountPrice.textColor = UIColor.gray
        discountPrice.font = UIFont(name: "Helvetica-Light", size: 20)
        discountPrice.font = discountPrice.font.withSize(5)
        discountPrice.font = UIFont.systemFont(ofSize: 12)
        discountPrice.textAlignment = NSTextAlignment.right
        discountPrice.textAlignment = .center
        self.view.addSubview(discountPrice)
//打折價錢顯示框
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = UIColor.gray
        priceLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        priceLabel.font = priceLabel.font.withSize(5)
        priceLabel.font = UIFont.systemFont(ofSize: 12)
        priceLabel.textAlignment = NSTextAlignment.right
        priceLabel.textAlignment = .center
        priceLabel.numberOfLines = 1
        priceLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        self.view.addSubview(priceLabel)
//打折滑桿
        theSlider = UISlider()
        theSlider.translatesAutoresizingMaskIntoConstraints = false
        theSlider.backgroundColor = UIColor.clear // UISlider 滑桿按鈕右邊 尚未填滿的顏色
        theSlider.maximumTrackTintColor = UIColor.orange// UISlider 滑桿按鈕右邊 尚未填滿的顏色
        theSlider.minimumTrackTintColor = UIColor.green // UISlider 滑桿按鈕左邊 已填滿的顏色
        theSlider.thumbTintColor = UIColor.white // UISlider 滑桿按鈕的顏色
        theSlider.minimumValue = 0  // UISlider 的最小值
        theSlider.maximumValue = 100 // UISlider 的最大值
        theSlider.value = 50 // UISlider 預設值
        theSlider.isContinuous = true // UISlider 是否可以在變動時同步執行動作
        
        theSlider.addTarget(
            self,
            action:
                #selector(ViewController.onSliderChange),
            for: UIControl.Event.valueChanged)// 設置位置並放入畫面中
        
        self.view.addSubview(theSlider)
        
//黑夜模式開關
        
        theSwitch = UISwitch()
        theSwitch.translatesAutoresizingMaskIntoConstraints = false
        theSwitch.thumbTintColor = UIColor.orange
        theSwitch.tintColor = UIColor.blue
        theSwitch.onTintColor = UIColor.brown
        theSwitch.addTarget(self, action: #selector(ViewController.onChange), for: .valueChanged)
        //self.theSlider.transform = CGAffineTransform(rotationAngle: 180)
        self.view.addSubview(theSwitch)
            
        theDarkMode = UILabel()
        theDarkMode.translatesAutoresizingMaskIntoConstraints = false
        theDarkMode.text = "Dark Mode"
        theDarkMode.textColor = .gray
        theDarkMode.font = UIFont.systemFont(ofSize: 12)
        self.view.addSubview(theDarkMode)
        
        NSLayoutConstraint.activate([
            //標題的部分
            theTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor), //畫面的邊界距離
            theTitle.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            //theTitle.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor,multiplier: 0.1),
            
            //輸入框的部分
            theTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant:100),//在theTitle的下面
            theTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant:100),
            theTextField.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 100),
            theTextField.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor,constant: -100),
            theTextField.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor,multiplier: 0.5),
            theTextField.heightAnchor.constraint(equalTo:view.layoutMarginsGuide.heightAnchor,multiplier: 0.1),
            
            //打折字樣
            discountLabel.topAnchor.constraint(equalTo: theTextField.bottomAnchor,constant: 10),
            discountLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            //將打折標籤固定到輸入文字標籤的底部
            
            //打折趴數（變動數字）
            discount.topAnchor.constraint(equalTo: discountLabel.topAnchor),
            discount.centerXAnchor.constraint(equalTo: discountLabel.layoutMarginsGuide.leadingAnchor,constant: 40),
            discount.heightAnchor.constraint(equalTo: discountLabel.heightAnchor), //打折價錢要跟打折標籤一樣高
            
            //折扣價（變動數字）
            discountPrice.topAnchor.constraint(equalTo: discountLabel.topAnchor),
            discountPrice.centerXAnchor.constraint(equalTo: discountLabel.layoutMarginsGuide.leadingAnchor,constant:150),
            
            
            //“打折後價錢”字樣
            theLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor,constant: 10),
            theLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            
            //打折後價錢（變動數字）
            priceLabel.topAnchor.constraint(equalTo: theLabel.topAnchor),
            priceLabel.centerXAnchor.constraint(equalTo: discountLabel.layoutMarginsGuide.leadingAnchor, constant: 150),
            //滑桿
            
            theSlider.topAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor,constant:80),//在theTitle的下面
            //theSlider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant:0),
            theSlider.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 0),
            theSlider.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor,constant: 0),
            theSlider.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor,multiplier: 0.5),
            theSlider.heightAnchor.constraint(equalTo:view.layoutMarginsGuide.heightAnchor,multiplier: 0.1),

            theSwitch.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            theSwitch.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            //黑夜開關字樣
            theDarkMode.bottomAnchor.constraint(equalTo: theSwitch.topAnchor),
            theDarkMode.leadingAnchor.constraint(equalTo: theSwitch.leadingAnchor)
            
            
        
        ])


        
    }


}


