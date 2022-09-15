//
//  TiledLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/7.
//

import UIKit

class TiledLayerController: UIViewController, CALayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = CGRect(x: x, y: y, width: width, height: width)
        self.view.addSubview(scrollView)
        
        let tileLayer = CATiledLayer()
        tileLayer.frame = CGRect(x: 0, y: 0, width: 2048, height: 2048)
        tileLayer.delegate = self
        tileLayer.contentsScale = UIScreen.main.scale
        scrollView.layer.addSublayer(tileLayer)
        scrollView.contentSize = tileLayer.frame.size
        tileLayer.display()
    }
    

    func draw(_ layer: CALayer, in ctx: CGContext) {
        let layer = layer as! CATiledLayer
        let bounds = ctx.boundingBoxOfClipPath
        let x = Int(bounds.origin.x / layer.tileSize.width)
        let y = Int(bounds.origin.y / layer.tileSize.height)
        let index = x * (y + 1)
        print("x:\(x)--y:\(y)")
        guard let imgPath = Bundle.main.path(forResource: "202287155129659img_snowman_2048x2048_\(index)", ofType: "jpeg") else {
            return
        }
        guard let img = UIImage(contentsOfFile: imgPath) else { return }
        UIGraphicsPushContext(ctx)
        img.draw(in: bounds)
        UIGraphicsPopContext()
    }
}
