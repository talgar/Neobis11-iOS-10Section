//
//  ViewController.swift
//  Kinoafisha
//
//  Created by admin on 14.12.2020.
//

import UIKit
import WebKit

class WebVC: UIViewController{

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }

    func loadWebView(){
        let url = URL(string: "https://kinoafisha.ua")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

