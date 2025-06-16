//
//  MoveViewController.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 16.06.25.
//

import UIKit

class MoveViewController: UIViewController {
    
    let redView = UIView(frame: CGRect(x: 20, y: 100, width: 140, height: 100))
    
    let button = AnimateButton(text: "Move")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(moveAnimation), for: .touchUpInside)

        view.addSubview(redView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor, multiplier: 2),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    @objc func moveAnimation()
    {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 90
        animation.toValue = 300
        animation.duration = 1
        
        redView.layer.add(animation, forKey: "move")
        redView.layer.position = CGPoint(x: 300, y: 150)
    }
}
