//
//  ViewController.swift
//  FB3 Schwarzes Brett WHS
//
//  Created by stenosis on 09.12.18.
//  Copyright © 2018 TRi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the status bar color
        let statusBarCol = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        setStatusBarBackgroundColor(color: statusBarCol)
        
        // set and load the infopage
        let url = URL(string: "http://homepage.informatik.fh-gelsenkirchen.de/fachbereich/insider/insider.html")!
        webView.load(URLRequest(url: url))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }

}

