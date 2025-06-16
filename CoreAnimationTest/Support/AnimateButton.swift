//
//  AnimateButton.swift
//  CoreAnimationTest
//
//  Created by Shamil Bayramli on 16.06.25.
//

import UIKit

class AnimateButton: UIButton {
    
    init(text: String)
    {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        config.title = text
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        configuration = config
        
        titleLabel?.adjustsFontSizeToFitWidth = true
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
