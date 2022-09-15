//
//  MediaTimingController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/13.
//

import UIKit

class MediaTimingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        configAnimationPath()
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
        animation.path = bezierPath.cgPath
        animation.rotationMode = CAAnimationRotationMode.rotateAuto; // 调整旋转方向
//        animation.repeatCount = 3
//        animation.duration = 4.0
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        snowmanLayer.add(animation, forKey: nibName)
    }
}
