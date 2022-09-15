//
//  AnimationAffairscController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/8.
//

import UIKit

class AnimationAffairscController: UIViewController {
    let colorLayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        
        colorLayer.backgroundColor = UIColor.random().cgColor
        self.view.layer.addSublayer(colorLayer)
        colorLayer.frame = CGRect(x: x, y: y, width: width, height: width)

        // 自定义隐式动画
        
        let transition = CATransition.init()
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        colorLayer.actions = ["backgroundColor":transition]
        
        let button = UIButton(type: .custom)
        button.setTitle("改变颜色", for: .normal)
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        button.setTitleColor(UIColor.random(), for: .normal)
        button.sizeToFit()
        self.view.addSubview(button)
        button.frame = CGRect(x: x, y: colorLayer.frame.maxY + 20, width: button.frame.size.width, height: button.frame.size.height)
    }
    
    @objc func changeColor () {
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        CATransaction.setAnimationDuration(1.2)
//        CATransaction.setCompletionBlock {
//            let transform = CGAffineTransform(rotationAngle: Double.pi)
//            self.colorLayer.setAffineTransform(transform)
//        }
        colorLayer.backgroundColor = UIColor.random().cgColor
//        CATransaction.commit()
    }
    

}
