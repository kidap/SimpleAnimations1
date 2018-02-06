//
//  NewViewController.swift
//  Animations
//
//  Created by Karlo Pagtakhan on 02/03/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class BouncingViewController: UIViewController {
    @IBOutlet var button: BouncingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        button.animate()
        button.setup()
    }
}


class BouncingButton: UIButton, Animatable {
    var viewAnimator: UIViewPropertyAnimator!
    
    var isReversed: Bool = false {
        didSet{
            viewAnimator.isReversed = isReversed
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        backgroundColor = .pastelRed
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        
        contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func animate() {
        viewAnimator.startAnimation()
    }
    
    func animate(by fraction: CGFloat) {
    }
    
    func initialState() {
    }
    
    func finalState() {
    }
}

private extension BouncingButton {
    func setup() {
        setupAnimator()
        initialState()
    }
    
    func setupAnimator() {
        viewAnimator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.9, animations: {
            self.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        })
        
        viewAnimator.addAnimations {
            self.transform = CGAffineTransform.identity
        }
    }
}
