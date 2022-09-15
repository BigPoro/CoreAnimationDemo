//
//  KeyframeAnimationController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/13.
//

import UIKit

class KeyframeAnimationController: UIViewController,CAAnimationDelegate {
    private let colorLayer = CALayer.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        configBasicAnimation()
//        configAnimationPath()
    }
    
    
    
    // 属性动画 和 普通关键帧动画
    func configBasicAnimation() {
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        
        colorLayer.backgroundColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(colorLayer)
        colorLayer.frame = CGRect(x: x, y: y, width: width, height: width)
        
        let button = UIButton(type: .custom)
        button.setTitle("改变颜色", for: .normal)
        button.addTarget(self, action: #selector(keyframeAnimation), for: .touchUpInside)
//        button.addTarget(self, action: #selector(basicAnimation), for: .touchUpInside)
        button.setTitleColor(UIColor.random(), for: .normal)
        button.sizeToFit()
        self.view.addSubview(button)
        button.frame = CGRect(x: x, y: colorLayer.frame.maxY + 20, width: button.frame.size.width, height: button.frame.size.height)
    }
    
    @objc func keyframeAnimation() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 2
        animation.values = [UIColor.random().cgColor,UIColor.random().cgColor,UIColor.random().cgColor,UIColor.blue.cgColor]
        let fn = CAMediaTimingFunction(name:.easeOut)
        animation.timingFunctions = [fn,fn,fn,fn]
        colorLayer.add(animation, forKey: nil)
    }
    
    @objc func basicAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.toValue = UIColor.random().cgColor
        animation.delegate = self
        colorLayer.add(animation, forKey: nibName)
    }
    
    // 贝塞尔曲线动画
    func configAnimationPath() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 150))
        bezierPath.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        
        let pathLayer = CAShapeLayer()
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.strokeColor = UIColor.random().cgColor
        pathLayer.lineWidth = 3.0
        self.view.layer.addSublayer(pathLayer)
        
        let snowmanLayer = CALayer()
        snowmanLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        guard let imgPath = Bundle.main.path(forResource: "img_snow_man", ofType: "jpeg") else {
            return
        }
        let img = UIImage(contentsOfFile: imgPath)
        snowmanLayer.contents = img!.cgImage;
        self.view.layer.addSublayer(snowmanLayer)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 4.0
        animation.path = bezierPath.cgPath
        animation.rotationMode = CAAnimationRotationMode.rotateAuto; // 调整旋转方向
        snowmanLayer.add(animation, forKey: nibName)
    }
    
    @objc func animationPath() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 2
        animation.values = [UIColor.random().cgColor,UIColor.random().cgColor,UIColor.random().cgColor,UIColor.blue.cgColor]
        colorLayer.add(animation, forKey: nil)
    }
    
//    private func animationDidStop(_ anim: CABasicAnimation, finished flag: Bool) {
//        CATransaction.begin()
//        CATransaction.setDisableActions(true) // 关闭隐式动画 防止多次动画
//        colorLayer.backgroundColor = anim.toValue as! CGColor?
//        CATransaction.commit()
//    }

}
