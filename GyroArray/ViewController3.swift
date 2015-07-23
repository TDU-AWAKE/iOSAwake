//
//  ViewController3.swift
//  GyroArray
//
//  Created by 崔漢鐘 on 2015/07/18.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import Foundation
import UIKit

class ViewController3: UIViewController, UIScrollViewDelegate {
    
    let BETWEEN_WIDTH = CGFloat(5)
    let NUMPAGES = 3
    var barColor = UIColor(red: CGFloat(0.18), green: CGFloat(0.80), blue: CGFloat(0.44), alpha: CGFloat(1.0))
    var pageControl = UIPageControl()
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.barTintColor = barColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        scrollView.contentSize = CGSizeMake((self.view.frame.size.width + BETWEEN_WIDTH * 2)
            * CGFloat(NUMPAGES), self.view.frame.size.height)
        
        scrollView.pagingEnabled = true // ページするオプションを有効にするための設定
        scrollView.scrollEnabled = true
        scrollView.directionalLockEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.bounces = true
        scrollView.scrollsToTop = false
        scrollView.delegate = self
        self.navigationItem.titleView = pageControl

        func scrollViewDidScroll(scrollview: UIScrollView) {
            var pageWidth : CGFloat = self.scrollView.frame.size.width
            var fractionalPage : Double = Double(self.scrollView.contentOffset.x / pageWidth)
            var page : NSInteger = lround(fractionalPage)
            self.pageControl.currentPage = page;
}
}
}

