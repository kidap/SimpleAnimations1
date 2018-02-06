//
//  CardFlipViewController.swift
//  Animations
//
//  Created by Karlo Pagtakhan on 02/04/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class CardFlipViewController: UIViewController {
    
    @IBOutlet private var cardView: CardButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cardTapped(sender: UIButton) {
        cardView.animate()
    }
}


class CardButton: UIButton, Animatable {
    var viewAnimator: UIViewPropertyAnimator!
    
    var isReversed: Bool = false {
        didSet{
            viewAnimator.isReversed = isReversed
        }
    }
    
    private var isOpen = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = 5
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2
    }
    
    func animate() {
        if isOpen {
            initialState()
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                self.transform = CGAffineTransform.identity
                self.superview?.backgroundColor = .white
            }, completion: nil)
        } else {
            finalState()
            UIView.transition(with: self, duration: 0.3, options: .transitionFlipFromRight, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.75, y: 1.75)
                self.superview?.backgroundColor = .lightGray
            }, completion: nil)
        }
        
        isOpen = !isOpen
    }
    
    func animate(by fraction: CGFloat) {
        viewAnimator.fractionComplete = fraction
    }
    
    func initialState() {
        setImage(#imageLiteral(resourceName: "backCard"), for: .normal)
        imageView?.contentMode = .scaleAspectFill
    }
    
    func finalState() {
        backgroundColor = .pastelYellow
        setImage(#imageLiteral(resourceName: "frontCard"), for: .normal)
        imageView?.contentMode = .scaleAspectFit
    }
}

private extension CardButton {
    func setup() {
        setupAnimator()
        initialState()
    }
    
    func setupAnimator() {
        viewAnimator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.9, animations: {
            self.finalState()
            
        })
        
        viewAnimator.pausesOnCompletion = true
    }
}
