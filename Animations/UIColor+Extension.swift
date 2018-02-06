//
//  UIColor+Extension.swift
//  Animations
//
//  Created by Karlo Pagtakhan on 02/04/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

extension UIColor {
    static var pastelBlue = UIColor(r: 186, g: 225, b: 255)
    static var pastelGreen = UIColor(r: 186, g: 255, b: 201)
    static var pastelYellow = UIColor(r: 255, g: 255, b: 186)
    static var pastelRed = UIColor(r: 255, g: 179, b: 186)
}
