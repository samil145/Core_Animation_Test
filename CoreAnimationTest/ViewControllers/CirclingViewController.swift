//
//  CirclingViewController.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 16.06.25.
//

import UIKit

class CirclingViewController: UIViewController {

    let redView = UIView()
    let width: CGFloat = 40
    let height: CGFloat = 40
    
    let redCircle = UIImageView()
    let diameter: CGFloat = 300
    
    let button = AnimateButton(text: "Circling")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .systemRed
        
        button.addTarget(self, action: #selector(circlingAnimation), for: .touchUpInside)
        
        view.addSubview(redView)
        view.addSubview(redCircle)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor, multiplier: 2),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        redView.frame = CGRect(x: view.bounds.midX - width/2,
                               y: view.bounds.midY - height/2,
                               width: width, height: height)

        redCircle.frame = CGRect(x: view.bounds.midX - diameter/2,
                               y: view.bounds.midY - diameter/2,
                               width: diameter, height: diameter)

        let renderer = UIGraphicsImageRenderer(size: CGSize(width: diameter, height: diameter))

        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: diameter, height: diameter)

            ctx.cgContext.setStrokeColor(UIColor.red.cgColor)
            ctx.cgContext.setFillColor(UIColor.clear.cgColor)
            ctx.cgContext.setLineWidth(1)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }

        redCircle.image = img
    }
    
    @objc func circlingAnimation()
    {
        let boundingRect = CGRect(x: -diameter/2, y: -diameter/2, width: diameter, height: diameter)
        
        let orbit = CAKeyframeAnimation(keyPath: "position")
        orbit.path = CGPath(ellipseIn: boundingRect, transform: nil)
        
        orbit.duration = 2
        orbit.isAdditive = true
        orbit.calculationMode = .paced
        orbit.rotationMode = .rotateAuto
        
        redView.layer.add(orbit, forKey: "circle")
    }

}
