//
//  CoolImageLibrary.swift
//  TestAssignment
//
//  Created by Ihor Vlasyuk on 11/27/19.
//  Copyright © 2019 Ihor Vlasyuk. All rights reserved.
//

import Foundation
import UIKit

// DON'T EXPECT GRAND DESIGNS
// KEEP IT SIMPLE STUPID

public class CoolImageLibrary: NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    
 public  var delegate: CoolImageLibraryDownloadProgressDelegate?

 public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    
    DispatchQueue.main.async {
        self.delegate?.providePercentage(progress: Float(totalBytesWritten) / Float(totalBytesExpectedToWrite))
    }
 }
    
 public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
            if let data = try? Data(contentsOf: location), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.delegate?.imageDownloaded(image: image)
                }
            } else {
               self.delegate?.downloadingErorr()
            }
    }
    
    
    public func downloadImage(imgUrl: String) {
        let url = URL(string: imgUrl)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        session.downloadTask(with: url!).resume()
    }
}
    
public protocol CoolImageLibraryDownloadProgressDelegate {
    func imageDownloaded(image: UIImage)
    func downloadingErorr()
    func providePercentage(progress: Float)
}


