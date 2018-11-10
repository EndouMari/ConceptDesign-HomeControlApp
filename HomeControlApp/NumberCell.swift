//
//  NumberCell.swift
//  HomeControlApp
//
//  Created by Mari Endo on 2018/11/11.
//  Copyright © 2018年 MariEndo. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    var number: Int = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }
    
    @IBOutlet weak var numberLabel: UILabel!
}
