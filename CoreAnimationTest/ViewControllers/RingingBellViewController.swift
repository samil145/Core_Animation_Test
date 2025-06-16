//
//  RingingBellViewController.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 16.06.25.
//

import UIKit

class RingingBellViewController: UIViewController {
    
    let imageView = UIImageView(image: UIImage(systemName: "bell.fill"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.tintColor = .label

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))) 
        imageView.addGestureRecognizer(tapGesture)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
    @objc func imageViewTapped(_ recognizer: UITapGestureRecognizer) {
        shake()
    }

    private func shake() {
        let dur = 0.1667
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [],
          animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: dur) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur,
                               relativeDuration: dur) {
                self.imageView.transform = CGAffineTransform(rotationAngle: +.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*2,
                               relativeDuration: dur) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*3,
                               relativeDuration: dur) {
                self.imageView.transform = CGAffineTransform(rotationAngle: +.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*4,
                               relativeDuration: dur) {
                self.imageView.transform = CGAffineTransform(rotationAngle: -.pi/8)
            }
            UIView.addKeyframe(withRelativeStartTime: dur*5,
                               relativeDuration: dur) {
                self.imageView.transform = CGAffineTransform.identity
            }
          },
          completion: nil
        )
    }
    
}
