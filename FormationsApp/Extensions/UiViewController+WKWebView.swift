//
//  UiViewController+WKWebView.swift
//  FormationsApp
//
//  Created by Angelique Babin on 19/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import WebKit

// MARK: - Extension to setup webview

extension UIViewController {
    
    func setupWebView(webView: WKWebView, barItemsCollection: [UIBarButtonItem]) {
        setupUI(webView: webView)
        setupToolBar()
        setupNavItem(barItemsCollection: barItemsCollection)
    }
    
    private func setupUI(webView: WKWebView) {
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
    
    private func setupToolBar() {
        navigationController?.toolbar.barTintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        navigationController?.isToolbarHidden = false
    }
    
    private func setupNavItem(barItemsCollection: [UIBarButtonItem]) {
        for barItem in barItemsCollection {
            barItem.tintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        }
        self.navigationItem.rightBarButtonItems = barItemsCollection
    }
    
    /// open url or pdf  in webview
    func loadLink(_ urlSttring: String, webView: WKWebView) {
//        guard let suffixPdf = cellule?.link.hasSuffix(".pdf") else { return }
        let suffixPdf = urlSttring.hasSuffix(".pdf")
        if suffixPdf {
            let ressource = urlSttring.dropString
            loadPdf(ressource, webView: webView)
        } else {
            loadWebsite(urlSttring, webView: webView)
        }
    }

    /// display pdf in webview
    private func loadPdf(_ resource: String, webView: WKWebView) {
        guard let urlPdf = Bundle.main.url(forResource: resource, withExtension: "pdf") else { return }
        print(urlPdf)
        webView.load(URLRequest(url: urlPdf))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    /// open url in webview
    func loadWebsite(_ urlSttring: String, webView: WKWebView) {
        guard let url = URL(string: urlSttring) else { return }
        print(url)
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    /// open url with safari
    func openSafari(_ urlString: String) {
        let suffixPdf = urlString.hasSuffix(".pdf")
        if suffixPdf {
            presentAlert(typeError: .offline)
        } else {
            guard let url = URL(string: urlString) else { return }
            guard UIApplication.shared.canOpenURL(url) else { return }
            UIApplication.shared.open(url)
        }
    }

    /// share a link or a pdf
    func shareContent(website: String, shareBarButtonItem: UIBarButtonItem, view: UIViewController) {
        var shareLink: URL? {
            let linkToShare = URL(string: website)
            return linkToShare
        }
        
        var sharePdf: URL? {
            var pdfToShare: URL?
            let ressource = website.dropString
            if let urlPdf = Bundle.main.url(forResource: ressource, withExtension: "pdf") {
                pdfToShare = urlPdf
            }
            return pdfToShare
        }
        shareTypeOfContent(website, sharePdf, shareBarButtonItem, shareLink)
    }
    
    /// check if link or pdf to share and set UIActivityViewController
    private func shareTypeOfContent(_ website: String, _ sharePdf: URL?, _ shareBarButtonItem: UIBarButtonItem, _ shareLink: URL?) {
        let suffixPdf = website.hasSuffix(".pdf")
        if suffixPdf {
            guard let sharePdf = sharePdf else { return }
            let viewController = UIActivityViewController(activityItems: [sharePdf], applicationActivities: [])
            presentShare(viewController, shareBarButtonItem)
        } else {
            guard let shareLink = shareLink else { return }
            let viewController = UIActivityViewController(activityItems: [shareLink], applicationActivities: [])
            presentShare(viewController, shareBarButtonItem)
        }
    }
    
    /// present UIActivityViewController to share
    private func presentShare(_ viewController: UIActivityViewController, _ shareBarButtonItem: UIBarButtonItem) {
        present(viewController, animated: true)
        if let popOver = viewController.popoverPresentationController {
            popOver.sourceView = self.view
            popOver.barButtonItem = shareBarButtonItem
        }
    }
}
