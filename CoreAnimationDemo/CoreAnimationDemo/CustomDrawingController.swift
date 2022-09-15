//
//  CustomDrawingController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/5.
//

import UIKit

class CustomDrawView: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.blue.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}

class CustomDrawingController: UIViewController, CALayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let customDrawView = CustomDrawView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        self.view.addSubview(customDrawView)
        
//        layerDisplay()
    }
    
    func layerDisplay() {
        let layerView = UIView.init(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        layerView.backgroundColor = .white
        layerView.center = self.view.center
        self.view.addSubview(layerView)
        
        let blueLayer = CALayer.init()
        blueLayer.frame = layerView.bounds
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.delegate = self
        layerView.layer.addSublayer(blueLayer)
        
        blueLayer.display() // 需要手动display
    }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
