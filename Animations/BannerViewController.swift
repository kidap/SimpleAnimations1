//
//  BannerViewController.swift
//  Animations
//
//  Created by Karlo Pagtakhan on 02/03/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class BannerViewController: UIViewController {
    let bannerView = BannerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBannerView()
    }
    
    @IBAction func toggleBanner(_ sender: Any) {
        bannerView.animate()
    }
}

extension BannerViewController {
    func createBannerView() {
        bannerView.setParent(view)
    }
}

class BannerView: UIView {
    let bannerHeight: CGFloat = 100
    let borderWidtch: CGFloat = 5.0
    
    var viewAnimator: UIViewPropertyAnimator!
    var isReversed: Bool = false {
        didSet{
            viewAnimator.isReversed = isReversed
        }
    }
    
    private var view: UIView! {
        didSet {
            setConstraints(view: view)
            initialState()
        }
    }
    
    var bottomConstraint: NSLayoutConstraint!
    var isShown = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setParent(_ inputView: UIView) {
        view = inputView
    }
}

extension BannerView: Animatable {
    func animate() {
        isReversed = isShown
        viewAnimator.startAnimation()
        isShown = !isShown
    }
    
    func animate(by fraction: CGFloat) {
        viewAnimator.fractionComplete = fraction
    }
    
    func initialState() {
        bottomConstraint.constant = 0
    }
    
    func finalState() {
        bottomConstraint.constant = bannerHeight + borderWidtch + view.safeAreaInsets.top
    }
}

private extension BannerView {
    func setup() {
        setupAnimator()
        backgroundColor = .pastelBlue
        layer.cornerRadius = 5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
    
    func setConstraints(view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: borderWidtch).isActive = true
        rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -1 * borderWidtch).isActive = true
        heightAnchor.constraint(equalToConstant: bannerHeight).isActive = true
        bottomConstraint = bottomAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        bottomConstraint.isActive = true
    }
    
    func setupAnimator() {
        viewAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeOut) {
            self.finalState()
            self.view.layoutIfNeeded()
        }
        
        viewAnimator.pausesOnCompletion = true
    }
}
