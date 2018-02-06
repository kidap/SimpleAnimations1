//
//  SliderViewController.swift
//  Animations
//
//  Created by Karlo Pagtakhan on 02/03/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    @IBOutlet var viewToAnimate: AnimatableView!
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = 0
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        viewToAnimate.animate(by: CGFloat(slider.value))
    }
}

class AnimatableView: UIView, Animatable {
    
    var viewAnimator: UIViewPropertyAnimator!
    
    var isReversed: Bool = false {
        didSet{
            viewAnimator.isReversed = isReversed
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialState()
    }
    
    override func awakeFromNib() {
        backgroundColor = .pastelBlue
        layer.cornerRadius = 5
    }
    
    func animate() {
        viewAnimator.startAnimation()
    }
    
    func animate(by fraction: CGFloat) {
        viewAnimator.fractionComplete = fraction
    }
    
    func initialState() {
        viewAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1, animations: {
            self.finalState()
        })
        viewAnimator.pausesOnCompletion = true
    }
    
    func finalState() {
        backgroundColor = .pastelGreen
        transform = CGAffineTransform(rotationAngle: CGFloat.pi - 1)
        layer.cornerRadius = bounds.width / 2
    }
}
