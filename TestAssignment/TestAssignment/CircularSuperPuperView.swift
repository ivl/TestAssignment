//
//  CircularSuperPuperView.swift
//  TestAssignment
//
//  Created by Ihor Vlasyuk on 11/27/19.
//  Copyright © 2019 Ihor Vlasyuk. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CircularSuperPuperView:  UIImageView {

    
    var progressLayer = CAShapeLayer()
    var currentLayer = CAShapeLayer()
    
    var progressLayerColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressLayerColor.cgColor
        }
    }
    var currentLayerColor = UIColor.white {
        didSet {
            currentLayer.strokeColor = currentLayerColor.cgColor
        }
    }
    
    func makeCircularPath() {
        
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        currentLayer.path = circlePath.cgPath
        currentLayer.fillColor = UIColor.clear.cgColor
        currentLayer.strokeColor = currentLayerColor.cgColor
        currentLayer.lineWidth = 5.0
        currentLayer.strokeEnd = 1.0
        layer.addSublayer(currentLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressLayerColor.cgColor
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeCircularPath()
    }
    
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateprogress")
    }
}
