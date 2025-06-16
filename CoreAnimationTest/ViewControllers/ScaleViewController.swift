//
//  ScaleViewController.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 16.06.25.
//

import UIKit

class ScaleViewController: UIViewController {
    
    let redview = UIView()
    let width: CGFloat = 140
    let height: CGFloat = 100
    
    let button = AnimateButton(text: "Scale Up")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redview.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(scaleAnimation), for: .touchUpInside)
        
        view.addSubview(redview)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor, multiplier: 2),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        redview.frame = CGRect(x: view.bounds.midX - width/2,
                               y: view.bounds.midY - height/2,
                               width: width,
                               height: height)
        
    }
    
    @objc func scaleAnimation()
    {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 0.5
        
        redview.layer.add(animation, forKey: "scale")
        redview.layer.transform = CATransform3DMakeScale(2, 2, 1)
    }
}
