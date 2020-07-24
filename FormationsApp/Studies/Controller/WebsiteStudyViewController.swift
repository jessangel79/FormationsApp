//
//  WebsiteStudyViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 07/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import WebKit

final class WebsiteStudyViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet private var pinchGesture: UIPinchGestureRecognizer!
    @IBOutlet private weak var safariBarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var shareBarButtonItem: UIBarButtonItem!
    
    // MARK: - Properties
    
    var cellule: Studies?

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
    
    // MARK: - Actions
    
    @IBAction private func pinchGestureAction(_ sender: UIPinchGestureRecognizer) {
        guard let gestureView = pinchGesture.view else { return }
        gestureView.transform = gestureView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
    }
    
    @IBAction private func safariBarButtonItemTapped(_ sender: UIBarButtonItem) {
        guard let urlCellule = cellule?.link else { return }
        openSafari(urlCellule)
    }
    
    @IBAction private func shareBarButtonItemTapped(_ sender: UIBarButtonItem) {
        guard let website = cellule?.link else { return }
        shareContent(website: website, shareBarButtonItem: shareBarButtonItem, view: self)
    }
 
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let barItemsCollection: [UIBarButtonItem] = [forwardBarItem, refreshBarItem, backBarItem]
        setupWebView(webView: webView, barItemsCollection: barItemsCollection)
        guard let link = cellule?.link else { return }
        loadLink(link, webView: webView)
//        loadLink()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let link = cellule?.link else { return }
        loadLink(link, webView: webView)
//        loadLink()
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
    
//    private func loadLink() {
//        guard let suffixPdf = cellule?.link.hasSuffix(".pdf") else { return }
//        if suffixPdf {
//            guard let ressource = cellule?.link.dropString else { return }
//            loadPdf(ressource)
//        } else {
//            loadWebsite(cellule?.link ?? "", webView: webView)
//        }
//    }
//
//    /// display pdf in webview
//    private func loadPdf(_ resource: String) {
//        guard let urlPdf = Bundle.main.url(forResource: resource, withExtension: "pdf") else { return }
//        print(urlPdf)
//        webView.load(URLRequest(url: urlPdf))
//        webView.allowsBackForwardNavigationGestures = true
//    }
}
