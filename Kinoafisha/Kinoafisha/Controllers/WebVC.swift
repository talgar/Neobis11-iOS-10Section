//
//  ViewController.swift
//  Kinoafisha
//
//  Created by admin on 14.12.2020.
//

import UIKit
import WebKit

class WebVC: UIViewController , WKNavigationDelegate, WKUIDelegate {
    
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        webView = WKWebView(frame: CGRect.zero)
        webView.navigationDelegate = self;
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true

        activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.view.center
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = .gray

        webView.addSubview(activityIndicator)
        view = webView

        let load_url = URL(string: "https://kinoafisha.ua/")!
        webView.load(URLRequest(url: load_url))
        activityIndicator.startAnimating()

        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
