//
//  ViewController.swift
//  TestAssignment
//
//  Created by Ihor Vlasyuk on 11/27/19.
//  Copyright © 2019 Ihor Vlasyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CoolImageLibraryDownloadProgressDelegate {
   
    var images = ["https://images.unsplash.com/photo-1547234935-80c7145ec969?ixlib=rb-1.2.1&auto=format&fit=crop&w=1953&q=80", "https://images.unsplash.com/photo-1547235001-d703406d3f17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1953&q=80",
    "https://images.unsplash.com/photo-1451188502541-13943edb6acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80",
    "https://images.unsplash.com/photo-1451188214936-ec16af5ca155?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80",
    "https://images.unsplash.com/photo-1527737071469-99ca92035fd6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2662&q=80"]
    
    static var counter: Int = 0
    @IBOutlet weak var circularProgress: CircularSuperPuperView!
    
    func imageDownloaded(image: UIImage) {
        self.circularProgress.image = image
        self.circularProgress.layer.cornerRadius = self.circularProgress.frame.width/2
        self.circularProgress.clipsToBounds = true
    }
    
    func downloadingErorr() {
        
    }
    
    func providePercentage(progress: Float) {
        circularProgress.setProgressWithAnimation(duration: 1.0, value: progress)
    }
    
    
    
    private var imgLibrary: CoolImageLibrary?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgLibrary = CoolImageLibrary()
        imgLibrary?.delegate = self
        self.circularProgress.image = UIImage(named : "placeholder")
        self.circularProgress.layer.cornerRadius = self.circularProgress.frame.width/2
        self.circularProgress.clipsToBounds = true
        circularProgress.currentLayerColor = UIColor.cyan
        circularProgress.progressLayerColor = UIColor.purple
        
    }

    
    @IBAction func downloadImage(sender : AnyObject) {
        
        imgLibrary?.downloadImage(imgUrl: images[ViewController.counter])
        
        ViewController.counter += 1
        
        if ViewController.counter >= images.count {
            ViewController.counter = 0
        }
    }
  
}




