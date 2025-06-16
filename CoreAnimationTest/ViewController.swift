//
//  ViewController.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 11.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let width: CGFloat = 140
    let height: CGFloat = 100
    
    let redSquare = UIView()
    let width_s: CGFloat = 40
    let height_s: CGFloat = 40
    
    let redCircle = UIImageView()
    let diameter: CGFloat = 300

    override func viewDidLoad() {
        super.viewDidLoad()
    
        redView.backgroundColor = .systemRed
        redSquare.backgroundColor = .systemRed
        
        //view.addSubview(redView)
        view.addSubview(redSquare)
        view.addSubview(redCircle)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //redView.frame = CGRect(x: view.bounds.midX - width/2, y: view.bounds.midY - height/2,                            width: width, height: height)
        
        redSquare.frame = CGRect(x: view.bounds.midX - width_s/2, y: view.bounds.midY - height_s/2, width: width_s, height: height_s)
        
        // Drawing Circle
        redCircle.frame = CGRect(x: view.bounds.midX - diameter/2, y: view.bounds.midY - diameter/2, width: diameter, height: diameter)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: diameter, height: diameter))
        
        let img = renderer.image { context in
            let rectangle = CGRect(x: 0, y: 0, width: diameter, height: diameter)
            
            context.cgContext.setStrokeColor(UIColor.red.cgColor)
            context.cgContext.setFillColor(UIColor.clear.cgColor)
            context.cgContext.setLineWidth(1)
            context.cgContext.addEllipse(in: rectangle)
            context.cgContext.drawPath(using: .fillStroke)
        }
        
        redCircle.image = img
        
        circlingAnimation(view_: redSquare)
    }
    
    func circlingAnimation(view_: UIView)
    {
        let boundingRect = CGRect(x: -diameter/2, y: -diameter/2, width: diameter, height: diameter)
        
        let orbit = CAKeyframeAnimation()
        orbit.keyPath = "position"
        
        orbit.path = CGPath(ellipseIn: boundingRect, transform: nil)
        orbit.duration = 2
        orbit.isAdditive = true
        orbit.calculationMode = CAAnimationCalculationMode.paced
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
        
        view_.layer.add(orbit, forKey: "circle")
    }
    
    func shakeAnimation(view_: UIView)
    {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        
        animation.isAdditive = true
        view_.layer.add(animation, forKey: "shake")
    }
    
    func rotateAnimation(view_: UIView)
    {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = 0
        animation.toValue = CGFloat.pi/4
        animation.duration = 1
        
        view_.layer.add(animation, forKey: "rotate")
        view_.layer.transform = CATransform3DMakeRotation(CGFloat.pi/4, 0, 0, 1)
    }
    
    func scaleAnimation(view_: UIView)
    {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 0.7
        
        view_.layer.add(animation, forKey: "scale")
        view_.layer.transform = CATransform3DMakeScale(2, 2, 1)
    }
    
    func moveAnimation(view_: UIView)
    {
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 20 + 140/2
        animation.toValue = 300
        animation.duration = 1
        
        view_.layer.add(animation, forKey: "horizontal_move")
        view_.layer.position = CGPoint(x: 300, y: 150)
        
    }


}

