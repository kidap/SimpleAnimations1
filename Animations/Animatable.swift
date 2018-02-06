//
//  Animatable.swift
//  Animations
//
//  Created by Karlo Pagtakhan on 02/04/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

protocol Animatable {
    var viewAnimator: UIViewPropertyAnimator! {get set}
    var isReversed: Bool { get set }
    
    func animate()
    func animate(by fraction: CGFloat)
    func initialState()
    func finalState()
}
