//
//  DetailViewController.swift
//  TopStoriesOfNewYorkTimesInTableViewWithCodable
//
//  Created by vagelis spirou on 21/06/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var detailStory: Story?
    
    override func loadView() {
        
        webView = WKWebView()
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailStory = detailStory else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailStory.title)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }

}
