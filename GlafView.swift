//
//  GlafView.swift
//  GyroArray
//
//  Created by SatanSatoh on 2015/07/13.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import Foundation
import UIKit

class GlafView: UIViewController {
    
    @IBOutlet var webview : UIWebView? = nil
    
    var targetURL = "https://awake-test.herokuapp.com/gruff/show/"
    //:twitterid/:uuid
    
    var twittername : String = ""
    var uuid : NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddressURL() {
        loadud()
        makeURL()
        let requestURL = NSURL(string: targetURL)
        let req = NSURLRequest(URL: requestURL!)
        webview!.loadRequest(req)
    }
    
    func loadud(){
        let ud = NSUserDefaults.standardUserDefaults()
        //println("読み込み準備完了")
        var UUIDs : [NSString]!
        if let UUIDs = ud.objectForKey("UUID") as? [NSString] {
            if let twittername = ud.objectForKey("@Twitter") as? [String] {
                
            }
        }
        uuid = UUIDs[UUIDs.count - 1]
    }
    
    func makeURL(){
        targetURL = targetURL + twittername + "/" + String(uuid)
    }
    
}