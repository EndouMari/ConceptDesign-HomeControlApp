//
//  AnimationView.swift
//  HomeControlApp
//
//  Created by Mari Endo on 2018/11/11.
//  Copyright © 2018年 MariEndo. All rights reserved.
//

import UIKit

class AnimationView: UIView {
    
    var value: Int = 0
    var diff: CGFloat = 0.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        contentMode = .redraw
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        path1.fill()
        path2.fill()
    }
    
    private var path1: UIBezierPath {
        let offset: CGFloat = 30.0 - CGFloat(value)
        let start = CGPoint(x: bounds.minX, y: bounds.minY + 50)
        let center = CGPoint(x: bounds.midX, y: bounds.minY + 50)
        let end = CGPoint(x: bounds.maxX, y: bounds.minY + 50)
        let cp1 =
            CGPoint(x: start.x + bounds.midX / 3,
                    y: start.y + offset)
        let cp2 =
            CGPoint(x: center.x - bounds.midX / 3,
                    y: start.y + offset)
        let cp3 =
            CGPoint(x: center.x + bounds.midX / 3,
                    y: center.y - offset)
        let cp4 =
            CGPoint(x: end.x - bounds.midX / 3,
                    y: center.y - offset)
        
        let line1 = CGPoint(x: end.x, y: bounds.maxY)
        let line2 = CGPoint(x: start.x, y: bounds.maxY)
        let line3 = CGPoint(x: start.x, y: start.y)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: center, controlPoint1: cp1, controlPoint2: cp2)
        path.addCurve(to: end, controlPoint1: cp3, controlPoint2: cp4)
        path.addLine(to: line1)
        path.addLine(to: line2)
        path.addLine(to: line3)
        
        let animationStart = UIScreen.main.bounds.height / 3
        let animationEnd = (UIScreen.main.bounds.height / 3) * 2
        let animationDistance = animationEnd - animationStart
        let startColor = UIColor(red: 40/255, green: 84/255, blue: 240/255, alpha: 0.5)
        let endColor = UIColor(red: 206/255, green: 8/255, blue: 33/255, alpha: 0.5)
        if bounds.height > animationStart {
            let ratio = Int(((bounds.height - animationStart) / animationDistance) * 100)
            let red = (endColor.red - startColor.red) * CGFloat(ratio) / 100 + startColor.red
            let green = (endColor.green - startColor.green) * CGFloat(ratio) / 100 + startColor.green
            let blue = (endColor.blue - startColor.blue) * CGFloat(ratio) / 100 + startColor.blue
            UIColor(red: red, green: green, blue: blue, alpha: 0.5).set()
        } else {
            startColor.set()
        }
        return path
    }
    
    private var path2: UIBezierPath {
        let offset: CGFloat = 30.0 - CGFloat(value)
        let start = CGPoint(x: bounds.minX, y: bounds.minY + 30)
        let center = CGPoint(x: bounds.midX, y: bounds.minY + 30)
        let end = CGPoint(x: bounds.maxX, y: bounds.minY + 30)
        let cp1 =
            CGPoint(x: start.x + bounds.midX / 3,
                    y: start.y - offset)
        let cp2 =
            CGPoint(x: center.x - bounds.midX / 3,
                    y: start.y - offset)
        let cp3 =
            CGPoint(x: center.x + bounds.midX / 3,
                    y: center.y + offset)
        let cp4 =
            CGPoint(x: end.x - bounds.midX / 3,
                    y: center.y + offset)
        
        let line1 = CGPoint(x: end.x, y: bounds.maxY)
        let line2 = CGPoint(x: start.x, y: bounds.maxY)
        let line3 = CGPoint(x: start.x, y: start.y)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: center, controlPoint1: cp1, controlPoint2: cp2)
        path.addCurve(to: end, controlPoint1: cp3, controlPoint2: cp4)
        path.addLine(to: line1)
        path.addLine(to: line2)
        path.addLine(to: line3)
        
        let animationStart = UIScreen.main.bounds.height / 3
        let animationEnd = (UIScreen.main.bounds.height / 3) * 2
        let animationDistance = animationEnd - animationStart
        let startColor = UIColor(red: 47/255, green: 98/255, blue: 247/255, alpha: 0.5)
        let endColor = UIColor(red: 204/255, green: 5/255, blue: 30/255, alpha: 0.5)
        if bounds.height > animationStart {
            let ratio = Int(((bounds.height - animationStart) / animationDistance) * 100)
            let red = (endColor.red - startColor.red) * CGFloat(ratio) / 100 + startColor.red
            let green = (endColor.green - startColor.green) * CGFloat(ratio) / 100 + startColor.green
            let blue = (endColor.blue - startColor.blue) * CGFloat(ratio) / 100 + startColor.blue
            UIColor(red: red, green: green, blue: blue, alpha: 0.5).set()
        } else {
            startColor.set()
        }
        return path
    }
}
