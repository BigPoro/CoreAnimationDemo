//
//  VectorGraphicsController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/14.
//

import UIKit

class DrawingView: UIView {
    class override var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    let path = UIBezierPath()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        let shapeLayer = self.layer as! CAShapeLayer
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineJoin = CAShapeLayerLineJoin.miter
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = 5.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let point = touches.first?.location(in: self) {
            path.move(to: point)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let point = touches.first?.location(in: self) {
            path.addLine(to: point)
            self.setNeedsDisplay()
        }
        let shapeLayer = self.layer as! CAShapeLayer
        shapeLayer.path = self.path.cgPath
    }
    override func draw(_ rect: CGRect) {
        UIColor.clear.setFill()
        UIColor.orange.setStroke()
        path.stroke()
    }
}

class VectorGraphicsController: UIViewController,CALayerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let drawingView = DrawingView()
        drawingView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        self.view.addSubview(drawingView)
        drawingView.center = self.view.center
    }
    

}
