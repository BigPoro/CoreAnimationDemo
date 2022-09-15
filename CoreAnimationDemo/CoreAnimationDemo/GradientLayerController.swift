//
//  GradientLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/6.
//

import UIKit

class GradientLayerController: UIViewController {
    var containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        containerView.frame = CGRect(x: x, y: y, width: width, height: width)
        self.view.addSubview(containerView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        gradientLayer.colors = [UIColor.random().cgColor,UIColor.random().cgColor,UIColor.random().cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [NSNumber(value: 0.1),NSNumber(value: 0.3),NSNumber(value: 0.8)]
        containerView.layer.addSublayer(gradientLayer)

    }
    
}
