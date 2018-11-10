//
//  UIColor+Extension.swift
//  HomeControlApp
//
//  Created by Mari Endo on 2018/11/11.
//  Copyright © 2018年 MariEndo. All rights reserved.
//

import UIKit

extension UIColor {
    
    var red: CGFloat {
        return cgColor.components?[0] ?? 0.0
    }
    
    var green: CGFloat {
        return cgColor.components?[1] ?? 0.0
    }
    
    var blue: CGFloat {
        return cgColor.components?[2] ?? 0.0
    }
}
