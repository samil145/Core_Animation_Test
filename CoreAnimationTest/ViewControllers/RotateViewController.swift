//
//  RotateViewController.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 16.06.25.
//

import UIKit

class RotateViewController: UIViewController {
    
    let redView = UIView()
    let width: CGFloat = 140
    let height: CGFloat = 100
    
    let button = AnimateButton(text: "Rotate")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .systemRed
        
        button.addTarget(self, action: #selector(rotateAnimation), for: .touchUpInside)
        
        view.addSubview(redView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor, multiplier: 2),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        redView.frame = CGRect(x: view.bounds.midX - width/2,
                               y: view.bounds.midY - height/2,
                               width: width,
                               height: height)
    }
    
    @objc func rotateAnimation()
    {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = 0
        animation.toValue = CGFloat.pi
        animation.duration = 1.5
        
        redView.layer.add(animation, forKey: "rotate")
        redView.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
        
    }
}
