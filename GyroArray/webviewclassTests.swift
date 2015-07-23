//
//  ViewController.swift
//  webviewclass
//
//  Created by SatanSatoh on 2015/07/21.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit


//ここにこの名前でmainstoryboardのwebviewの紐付け
//var webview : UIWebView? = nil

class webviewclassTests: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        webview.delegate = self
        
        // Webページの大きさを画面に合わせる
        var rect:CGRect = self.view.frame
        webview.frame = rect
        webview.scalesPageToFit = true
        
        // インスタンスをビューに追加する
        self.view.addSubview(webview)// Do any additional setup after loading the view, typically from a nib.
        var webviewclass : webviewGlaph = webviewGlaph(webview: webview)
        webviewclass.loadAddressURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class webviewGlaph{
    
    var twittername : AnyObject = ""
    var UUID : AnyObject = ""
    var graffURL = ""
    var fomatURL = "https://awake-test.herokuapp.com/gruff/show/"
    var webView: UIWebView?
    
    init(webview:UIWebView){
        self.webView = webview
        self.loadanything()
    }
    
    func loadanything(){
        let ud = NSUserDefaults.standardUserDefaults()
        twittername = ud.objectForKey("@Twittername")!
        UUID = ud.objectForKey("UUID")!
        println(twittername)
        println(UUID)
    }
    
    func makeURL(){
        graffURL = fomatURL + String(twittername as! NSString) + "/" + String(UUID as! NSString)
    }
    
    func viewset(){
        let requestURL = NSURL(string: graffURL)
        let req = NSURLRequest(URL: requestURL!)
        webView!.loadRequest(req)
    }
    
    func loadAddressURL(){
        makeURL()
        viewset()
    }
}