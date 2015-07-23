//
//  controlView4.swift
//  GyroArray
//
//  Created by 崔漢鐘 on 2015/07/21.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import Foundation
import UIKit

class controlView4 : UIViewController {
    private var myWindow: UIWindow!
    private var myWindowButton: UIButton!
    private var myButton: UIButton!
    internal func makeMyWindow(){
        
        // 背景を白に設定する.
        myWindow.backgroundColor = UIColor.whiteColor()
        myWindow.frame = CGRectMake(0, 0, 200, 250)
        myWindow.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        myWindow.alpha = 0.8
        myWindow.layer.cornerRadius = 20
        
        // myWindowをkeyWindowにする.
        myWindow.makeKeyWindow()
        
        // windowを表示する.
        self.myWindow.makeKeyAndVisible()
        
        // ボタンを作成する.
        myWindowButton.frame = CGRectMake(0, 0, 100, 60)
        myWindowButton.backgroundColor = UIColor.orangeColor()
        myWindowButton.setTitle("Close", forState: .Normal)
        myWindowButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myWindowButton.layer.masksToBounds = true
        myWindowButton.layer.cornerRadius = 20.0
        myWindowButton.layer.position = CGPointMake(self.myWindow.frame.width/2, self.myWindow.frame.height-50)
        myWindowButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.myWindow.addSubview(myWindowButton)
        
        // TextViewを作成する.
        let myTextView: UITextView = UITextView(frame: CGRectMake(10, 10, self.myWindow.frame.width - 20, 150))
        myTextView.backgroundColor = UIColor.clearColor()
        myTextView.text = "測定開始を押すと測定は始まります。測定開始・測定終了をもう一度押すと。測定を終了します。"
        myTextView.font = UIFont.systemFontOfSize(CGFloat(15))
        myTextView.textColor = UIColor.blackColor()
        myTextView.textAlignment = NSTextAlignment.Left
        myTextView.editable = false
        
        self.myWindow.addSubview(myTextView)
}
    internal func onClickMyButton(sender: UIButton) {
        
        if sender == myWindowButton {
            myWindow.hidden = true
        }
        else if sender == myButton {
            makeMyWindow()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
