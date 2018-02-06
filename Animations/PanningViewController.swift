//
//  PanningViewController.swift
//  Animations
//
//  Created by Karlo Pagtakhan on 02/04/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class PanningViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView(in: view)
    }
}


extension PanningViewController {
    func createView(in view: UIView) {
        let newView = UIView()
        newView.backgroundColor = .pastelRed
        
        view.addSubview(newView)
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        newView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
}
