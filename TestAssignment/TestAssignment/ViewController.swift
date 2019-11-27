//
//  ViewController.swift
//  TestAssignment
//
//  Created by Ihor Vlasyuk on 11/27/19.
//  Copyright © 2019 Ihor Vlasyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDelegate, URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        <#code#>
    }
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    private let byteFormatter: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useKB, .useMB]
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func downloadImage(sender : AnyObject) {
        // A 10MB image from NASA
        let url = URL(string: "https://photojournal.jpl.nasa.gov/jpeg/PIA08506.jpg")!
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        // Don't specify a completion handler here or the delegate won't be called
        session.downloadTask(with: url).resume()
    }


}

