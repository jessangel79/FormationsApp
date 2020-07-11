//
//  WebsiteStudiesViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 07/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import WebKit

final class WebsiteStudiesViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Properties
    
    var cellule: Themes?
    var allFileDict = [String: [Themes]]()

    private lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    private let forwardBarItem = UIBarButtonItem(title: ">>", style: .plain, target: self,
                                         action: #selector(forwardAction))
    private let backBarItem = UIBarButtonItem(title: "<<", style: .plain, target: self,
                                      action: #selector(backAction))
    private let refreshBarItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // test pdf start
        guard let pdfUrl = Bundle.main.url(forResource: "bac", withExtension: "pdf") else { return }
        webView.load(URLRequest.init(url: pdfUrl))
        // test pdf end

        setupUI()
        setupNavItem()
        loadWebsite()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Methods

    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
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

    private func setupNavItem() {
        self.navigationItem.rightBarButtonItems = [forwardBarItem, refreshBarItem, backBarItem]
    }

    private func loadWebsite() {
        guard let url = URL(string: cellule?.webSite ?? "") else { return }
        print(url)
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
