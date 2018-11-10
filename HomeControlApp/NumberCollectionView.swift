//
//  NumberCollectionView.swift
//  HomeControlApp
//
//  Created by Mari Endo on 2018/11/11.
//  Copyright © 2018年 MariEndo. All rights reserved.
//

import UIKit

class NumberCollectionview: UICollectionView {
    
    var numberData: [Int] = []
    var currentNumberIndex: Int = 0
    private var currentSection: Int = 0
    
    enum Direction {
        case up
        case down
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        dataSource = self
        delegate = self
        
        register(UINib(nibName: "NumberCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        isScrollEnabled = false
    }
    
    func setup(numberData: [Int], index: Int) {
        self.numberData = numberData
        scrollToItem(at: .init(item: index, section: 1), at: .top, animated: false)
    }
    
    func scrollToItem(at itemIndex: Int) {
        let indexPath: IndexPath
        if itemIndex == numberData.first && currentNumberIndex == numberData.last {
            indexPath = .init(item: 0, section: 2)
        } else if itemIndex == numberData.last && currentNumberIndex == numberData.first {
            indexPath = .init(item: 0, section: 0)
        } else {
            indexPath = .init(item: itemIndex, section: 1)
        }
        scrollToItem(at: indexPath, at: .top, animated: true)
        currentNumberIndex = itemIndex
        currentSection = indexPath.section
    }
    
    func scrollToItem(at itemIndex: Int, direction: Direction) {
        let indexPath: IndexPath
        
        if direction == .up && itemIndex <= currentNumberIndex {
            indexPath = .init(item: itemIndex, section: 2)
        } else if direction == .down && itemIndex >= currentNumberIndex {
            indexPath = .init(item: itemIndex, section: 0)
        } else {
            indexPath = .init(item: itemIndex, section: 1)
        }
        scrollToItem(at: indexPath, at: .top, animated: true)
        currentNumberIndex = itemIndex
        currentSection = indexPath.section
    }
}

extension NumberCollectionview: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NumberCell
        cell.number = numberData[indexPath.item]//number(at: indexPath)
        return cell
    }
    
    func number(at indexPath: IndexPath) -> Int {
        if indexPath.section == 0 {
            return numberData.last!
        } else if indexPath.section == 2 {
            return numberData.first!
        } else {
            return numberData[indexPath.item]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 34.0, height: 60.0)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if currentSection != 1 {
            scrollToItem(at: .init(item: currentNumberIndex, section: 1), at: .top, animated: false)
        }
    }
}
