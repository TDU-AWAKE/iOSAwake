//
//  ViewController.swift
//  loginTwitter
//
//  Created by SatanSatoh on 2015/06/29.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit
import TwitterKit


class ViewController12: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let logInButton = TWTRLogInButton(logInCompletion: {
            (session: TWTRSession!, error: NSError!) in
            let udtwittername = NSUserDefaults.standardUserDefaults()
            udtwittername.setObject(session.userName, forKey: "@Twitter")
            // play with Twitter session
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}