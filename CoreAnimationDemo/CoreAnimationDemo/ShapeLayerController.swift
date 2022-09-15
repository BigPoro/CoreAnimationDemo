//
//  ShapeLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/6.
//

import UIKit

class ShapeLayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray

        let containerView = UIView()
        containerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        containerView.center = self.view.center
        containerView.backgroundColor = .white
        self.view.addSubview(containerView)
        
        /// 设置路径
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 175, y: 100))
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: Double.pi * 2.0, clockwise: true) // 头部
        path.move(to: CGPoint(x: 150, y: 125))
        path.addLine(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 125, y: 225))
        path.move(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 175, y: 225))
        path.move(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 200, y: 150))

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5;
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.path = path.cgPath
        containerView.layer.addSublayer(shapeLayer)
        
        /// 设置圆角
        let rouderPath = UIBezierPath(roundedRect: containerView.bounds, byRoundingCorners: ([UIRectCorner.topLeft , UIRectCorner.bottomRight]), cornerRadii: CGSize(width: 40, height: 40))
        let rouderLayer = CAShapeLayer()
        rouderLayer.path = rouderPath.cgPath
        containerView.layer.mask = rouderLayer
    }
    
}
