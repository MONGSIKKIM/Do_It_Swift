//
//  ViewController.swift
//  WebViewMission
//
//  Created by 김홍식 on 12/19/23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var mainView: WKWebView!
    
    func loadWebPage(_ url:String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        mainView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.navigationDelegate = self
        let filePath = Bundle.main.path(forResource: "mainHtml", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        mainView.load(myRequest)
    }


}

