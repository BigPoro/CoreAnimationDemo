//
//  RenderModelController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/13.
//

import UIKit

class RenderModelController: UIViewController {
    private let colorLayer = CALayer.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        colorLayer.position = self.view.center
        colorLayer.backgroundColor = UIColor.random().cgColor
        self.view.layer.addSublayer(colorLayer)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self.view) else { return }
        if ((colorLayer.presentation()?.hitTest(point)) != nil) {
            colorLayer.backgroundColor = UIColor.random().cgColor
        } else {
            CATransaction.begin()
            CATransaction.setAnimationDuration(2.0)
            colorLayer.position = point
            CATransaction.commit()
        }
    }

}
