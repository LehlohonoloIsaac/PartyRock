//
//  VideoViewController.swift
//  PartyRockApp
//
//  Created by dvt on 2017/10/11.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var videoTitle: UILabel!
    
    private var _partyRock: PartyRock!
    
    var partyRock:PartyRock!{
        get{ return _partyRock }
        set{ _partyRock = newValue }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTitle.text = partyRock.videoTitle
        let url = URL(string: partyRock.videoURL)!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

}
