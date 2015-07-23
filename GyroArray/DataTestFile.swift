//
//  DataTestFile.swift
//  GyroArray
//
//  Created by SatanSatoh on 2015/06/25.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//
//
//  main.swift
//  swift_sample02
//

import Foundation

class file{

    let paths1 = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
    
    let _path = paths1[0].stringByAppendingPathComponent("text1.txt")
    
    init(){
    // 書き込み
    var data:NSString = ""
    data = (data as String) + "hoge1" + "\n"
    data = (data as String) + "hoge2" + "\n"
    data = (data as String) + "hoge3" + "\n"
    
    let success = data.writeToFile(_path, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
    if success {
    println("保存に成功")
        }
    }
}