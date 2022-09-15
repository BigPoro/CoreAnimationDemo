//
//  SolidObjectController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/6.
//

import UIKit
import GLKit

let AMBIENT_LIGHT:Float = 0.5

class SolidObjectController: UIViewController {
    var faces = Array<UIView>()
    var containerView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        containerView.frame = CGRect(x: x, y: y, width: width, height: width)
        self.view.addSubview(containerView)
        
        for i in 1...6 {
            let view = UIView()
            if i == 3 {
                let button = UIButton()
                button.setTitle(String(i), for: .normal)
                button.backgroundColor = .blue
                button.layer.cornerRadius = 6
                button.frame.size = CGSize(width: 100,height: 100)
                button.tag = 1
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                view.addSubview(button)
            } else {
                let label = UILabel()
                label.text = String(i)
                label.textColor = .orange;
                label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
                view.addSubview(label)
                label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                label.sizeToFit()
                label.tag = 1
                
                /// 关闭其他面的交互 蓝色按钮可以点击
                view.isUserInteractionEnabled = false
            }
            faces.append(view)
        }
        
        // 设置透视投影
        var perspective = CATransform3DIdentity
        perspective.m34 = -1/500.0
        // 旋转父视图 实现3D效果
        perspective = CATransform3DRotate(perspective, -Double.pi/4, 1, 0, 0);
        perspective = CATransform3DRotate(perspective, -Double.pi/4, 0, 1, 0);
        containerView.layer.sublayerTransform = perspective
        
        // face1
        var transform = CATransform3DMakeTranslation(0, 0, 100)
        self.addFace(index: 0, transform: transform)
        
        // face2
        transform = CATransform3DMakeTranslation(100, 0, 0);
        transform = CATransform3DRotate(transform, Double.pi/2, 0, 1, 0);
        self.addFace(index: 1, transform: transform)
        
        // face3
        transform = CATransform3DMakeTranslation(0, -100, 0);
        transform = CATransform3DRotate(transform, Double.pi/2, 1, 0, 0);
        self.addFace(index: 2, transform: transform)
        
        // face4
        transform = CATransform3DMakeTranslation(0, 100, 0)
        transform = CATransform3DRotate(transform, -Double.pi/2, 1, 0, 0)
        self.addFace(index: 3, transform: transform)
        
        // face5
        transform = CATransform3DMakeTranslation(-100, 0, 0)
        transform = CATransform3DRotate(transform, -Double.pi/2, 0, 1, 0)
        self.addFace(index: 4, transform: transform)
        
        // face6
        transform = CATransform3DMakeTranslation(0, 0, -100)
        transform = CATransform3DRotate(transform, -Double.pi, 0, 1, 0)
        self.addFace(index: 5, transform: transform)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        
    }

    func addFace(index:Int, transform:CATransform3D) {
        let face = faces[index]
        face.layer.backgroundColor = UIColor.white.cgColor
        let containerSize = containerView.bounds
        face.layer.frame = containerSize
        containerView.addSubview(face)
        face.center = CGPoint(x: containerSize.width/2.0, y: containerSize.height/2.0)
        face.viewWithTag(1)?.center = face.center // 设置Label居中
        face.layer.transform = transform
        self.applyLightingToFace(face: face.layer)
    }
    
    func applyLightingToFace(face:CALayer) {
        let layer = CALayer()
        layer.frame = face.bounds
        face.addSublayer(layer)
        
        let transform = face.transform
        /// GLKMatrix4和CATransform3D 互转
        let matrix4 = GLKMatrix4(m: (Float(transform.m11), Float(transform.m12), Float(transform.m13), Float(transform.m14), Float(transform.m21),  Float(transform.m22), Float(transform.m23), Float(transform.m24), Float(transform.m31), Float(transform.m32), Float(transform.m33), Float(transform.m34), Float(transform.m41), Float(transform.m42), Float(transform.m43), Float(transform.m44)));
        let matrix3 = GLKMatrix4GetMatrix3(matrix4)
        
        /// get face normal
        var normal = GLKVector3Make(0, 0, 1)
        normal = GLKMatrix3MultiplyVector3(matrix3, normal)
        normal = GLKVector3Normalize(normal)
        // get dot produce with light direction
        let light = GLKVector3Normalize(GLKVector3Make(0,1,-0.5))
        let dotProduct = GLKVector3DotProduct(light, normal)
        //set lighting layer opacity
        let shadow = 1.0 + dotProduct - AMBIENT_LIGHT;
        let color = UIColor(white: 0, alpha: CGFloat(shadow))
        layer.backgroundColor = color.cgColor;
    }
    
    @objc func buttonClicked() {
        print("点击了蓝色按钮")
    }
}
