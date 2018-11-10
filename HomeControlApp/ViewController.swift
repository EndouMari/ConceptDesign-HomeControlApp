//
//  ViewController.swift
//  HomeControlApp
//
//  Created by Mari Endo on 2018/11/11.
//  Copyright © 2018年 MariEndo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let maxWaterTemperature: Int = 60
    private let defaultWaterTemperature: Int = 5
    private let startColor: UIColor = UIColor(red: 79/255, green: 140/255, blue: 248/255, alpha: 1.0)
    private let endColor: UIColor = UIColor(red: 218/255, green: 20/255, blue: 40/255, alpha: 1.0)
    
    @IBOutlet weak var numberCollectionView1: NumberCollectionview!
    @IBOutlet weak var numberCollectionView2: NumberCollectionview!
    @IBOutlet private weak var animationView: AnimationView!
    @IBOutlet weak var animationViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationViewHeightConstraint.constant = (view.frame.height / CGFloat(maxWaterTemperature)) * CGFloat(defaultWaterTemperature)
        
        numberCollectionView1.setup(numberData: (0..<(maxWaterTemperature/10) + 1).map { $0 }, index: defaultWaterTemperature/10)
        numberCollectionView2.setup(numberData: (0..<10).map { $0 },index: defaultWaterTemperature%10)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let diff = touch.previousLocation(in: view).y - touch.location(in: view).y
        
        guard diff != 0.0 else { return }
        
        animationViewHeightConstraint.constant += diff
        
        if animationViewHeightConstraint.constant <= 0 {
            animationViewHeightConstraint.constant = 0
        } else if animationViewHeightConstraint.constant >= view.frame.height {
            animationViewHeightConstraint.constant = view.frame.height
        }
        
        let value: Int = Int(animationViewHeightConstraint.constant / view.frame.height * CGFloat(maxWaterTemperature))
        
        let onesDisit = value % 10
        if numberCollectionView2.currentNumberIndex != onesDisit {
            let direction: NumberCollectionview.Direction = diff > 0 ? .up : .down
            numberCollectionView2.scrollToItem(at: onesDisit, direction: direction)
        }
        
        let tensDisit = value / 10
        if numberCollectionView1.currentNumberIndex != tensDisit {
            let direction: NumberCollectionview.Direction = diff > 0 ? .up : .down
            self.numberCollectionView1.scrollToItem(at: tensDisit, direction: direction)
        }
        
        animationView.value = value
        animationView.diff = diff
        setBackgroundColor(value: value)
    }
    
    private func setBackgroundColor(value: Int) {
        let animationStart = maxWaterTemperature / 3
        let animationEnd = (maxWaterTemperature / 3) * 2
        let animationDistance = animationEnd - animationStart
        if value > animationStart {
            let ratio = (value - animationStart) * 100 / animationDistance
            let red = (endColor.red - startColor.red) * CGFloat(ratio) / 100 + startColor.red
            let green = (endColor.green - startColor.green) * CGFloat(ratio) / 100 + startColor.green
            let blue = (endColor.blue - startColor.blue) * CGFloat(ratio) / 100 + startColor.blue
            view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        } else {
            view.backgroundColor = startColor
        }
    }
}
