//
//  httpgets.swift
//  GyroArray
//
//  Created by SatanSatoh on 2015/06/23.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import Foundation

class HTTPControl{
    
    let uuid:NSUUID = NSUUID()
    var urlString : String
    var addURL : String
    var RequestMethod : String
    var request : NSMutableURLRequest
    var uuidNSStr : NSString
    var twittername : String
    
    init(tryURL:String,ToRequestMethod:String){
        urlString = tryURL
        request = NSMutableURLRequest()
        RequestMethod = ToRequestMethod
        uuidNSStr = uuid.UUIDString
        
        //usedata使ったバージョン
        let ud = NSUserDefaults.standardUserDefaults()
        twittername = (ud.objectForKey("@Twitter") as? String)!
        
        if(twittername == ""){
            twittername == "@error"
        }
        
        addURL = ""
        self.SaveUUID()
    }
    /*
    func UDTwitter()->String{
        let ud = NSUserDefaults.standardUserDefaults()
        var udname = (ud.objectForKey("@Twitter") as? String)!
        return udname
    }
    */
    
    func makeDataHTTP(userID:Int ,dataID : Int, data : Float){
        var Amount = String(stringInterpolationSegment: data)
        Amount = Amount.stringByReplacingOccurrencesOfString(".", withString: "_", options: nil, range: nil)
        addURL = urlString + "/" + twittername + "/" + String(uuidNSStr) + "/" + String(dataID) + "/" + Amount
        formatHTTP()
    }
    
    func formatHTTP(){
        request = NSMutableURLRequest(URL: NSURL(string: addURL)!)
        request.HTTPMethod = RequestMethod
    }
    
    func HTTPCheck(){
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { data, response, error in
            if (error == nil) {
                var result = NSString(data : data, encoding: NSUTF8StringEncoding)!
                println(result)
            } else {
                println(error)
            }
        })
        task.resume()
    }
    
    func GetDay()->String{
        var Dataday : String?
        let dateFormatter = NSDateFormatter()// フォーマットの取得
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")  // JPロケール
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"         // フォーマットの指定  HH:mm:ss
        Dataday = dateFormatter.stringFromDate(NSDate())                // 現在日時
        return Dataday!
    }
    
    func SaveUUID(){
        let SavedUD = NSUserDefaults.standardUserDefaults()
        SavedUD.setObject(uuidNSStr, forKey: "UUID")
        SavedUD.setObject(GetDay(), forKey: "GetDay")
    }
}