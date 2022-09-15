//
//  ShadowController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/5.
//

import UIKit

class ShadowController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let layerView = UIView.init(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        layerView.center = self.view.center
        self.view.addSubview(layerView)

        layerView.layer.shadowOpacity = 0.5
//        let squarePath = UIBezierPath(ovalIn: layerView.bounds)
        let squarePath = UIBezierPath(roundedRect: layerView.bounds, cornerRadius: 12)

        layerView.layer.shadowPath = squarePath.cgPath
    }

}
