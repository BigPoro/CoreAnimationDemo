//
//  TransformLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/6.
//

import UIKit

class TransformLayerController: UIViewController {
    var containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        containerView.frame = CGRect(x: x, y: y, width: width, height: width)
        self.view.addSubview(containerView)
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0/500
        containerView.layer.sublayerTransform = pt
        
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, -100, 0, 0)
        let cube1 = self.cubeWithTransform(transform: c1t)
        containerView.layer.addSublayer(cube1)
        
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 100, 0, 0)
        c2t = CATransform3DRotate(c2t, -Double.pi/4, 1, 0, 0)
        c2t = CATransform3DRotate(c2t, -Double.pi/4, 0, 1, 0)

        let cube2 = self.cubeWithTransform(transform: c2t)
        containerView.layer.addSublayer(cube2)
    }
    
    func faceWithTransform(transform:CATransform3D) -> CALayer {
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        face.backgroundColor = UIColor.random().cgColor
        face.transform = transform
        return face
    }
 
    func cubeWithTransform(transform:CATransform3D) -> CALayer {
        let cube = CATransformLayer()
        
        // face 1
        var ct = CATransform3DIdentity
        cube.addSublayer(self.faceWithTransform(transform: ct))
        
        // face 2
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, Double.pi/2, 0, 1, 0)
        cube.addSublayer(self.faceWithTransform(transform: ct))
        
        // face 3
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, Double.pi/2, 1, 0, 0)
        cube.addSublayer(self.faceWithTransform(transform: ct))
        
        // face 4
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, -Double.pi/2, 1, 0, 0)
        cube.addSublayer(self.faceWithTransform(transform: ct))
        
        // face 5
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, -Double.pi/2, 0, 1, 0)
        cube.addSublayer(self.faceWithTransform(transform: ct))
        
        // face 6
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, Double.pi, 0, 1, 0)
        cube.addSublayer(self.faceWithTransform(transform: ct))
        
        let containerSize = containerView.bounds
        cube.position = CGPoint(x: containerSize.width/2.0, y: containerSize.height/2.0)
        cube.transform = transform
        return cube
    }

}
