//
//  WebViewInformationsViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 17/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import WebKit

final class WebViewInformationsViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var safariBarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var shareBarButtonItem: UIBarButtonItem!
    
    // MARK: - Actions
    
    @IBAction private func safariBarButtonItemTapped(_ sender: UIBarButtonItem) {
        openSafari(badge)
    }
    
    @IBAction private func shareBarButtonItemTapped(_ sender: UIBarButtonItem) {
//        guard let website = cellule?.link else { return }
        shareContent(website: badge, shareBarButtonItem: shareBarButtonItem, view: self)
    }
    
    // MARK: - Properties
    
    private let forwardBarItem = UIBarButtonItem(title: ">>", style: .plain, target: self,
                                         action: #selector(forwardAction))
    private let backBarItem = UIBarButtonItem(title: "<<", style: .plain, target: self,
                                      action: #selector(backAction))
    private let refreshBarItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
    var badge = String()
        
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let barItemsCollection: [UIBarButtonItem] = [forwardBarItem, refreshBarItem, backBarItem]
        setupWebView(webView: webView, barItemsCollection: barItemsCollection)
        loadWebsite(badge, webView: webView)
    }
    
    // MARK: - Methods
    
    @objc private func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
        
    @objc private func backAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func refresh() {
        webView.reload()
    }

//    private func setupNavItem() {
//        let barItemsCollection: [UIBarButtonItem] = [forwardBarItem, refreshBarItem, backBarItem]
//        for barItem in barItemsCollection {
//            barItem.tintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
//        }
//        self.navigationItem.rightBarButtonItems = barItemsCollection
//    }
    
//    private func setupToolBar() {
//        safariBarButtonItem.tintColor = #colorLiteral(red: 0.397138536, green: 0.09071742743, blue: 0.3226287365, alpha: 1)
//        navigationController?.isToolbarHidden = false
//    }
    
//    private func setupWebView() {
//        let config = WKWebViewConfiguration()
//        config.dataDetectorTypes = [.all]
//        let webView = WKWebView(frame: .zero, configuration: config)
//        webView.uiDelegate = self
//    }

//    private func loadBadge(badge: String) {
//        guard let url = URL(string: badge) else { return }
//        print(url)
//        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true
//    }
    
//    private func openSafari() {
//        guard let url = URL(string: badge) else { return }
//        guard UIApplication.shared.canOpenURL(url) else { return }
//        UIApplication.shared.open(url)
//    }
}
