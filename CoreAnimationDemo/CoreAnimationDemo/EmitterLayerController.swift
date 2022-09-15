//
//  EmitterLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/7.
//

import UIKit

class EmitterLayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let containerView = UIView()
        
        let width = 100.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        containerView.frame = CGRect(x: x, y: y, width: width, height: width)
        self.view.addSubview(containerView)
        
        let emitter = CAEmitterLayer()
        emitter.frame = containerView.bounds
        containerView.layer.addSublayer(emitter)
        emitter.renderMode = CAEmitterLayerRenderMode.unordered // 粒子混合方式
        emitter.emitterPosition = CGPoint(x: emitter.frame.size.width/2, y: emitter.frame.size.height/2)
        // 添加 Cell
        let cell = CAEmitterCell()
        cell.contents = UIImage.init(named:"icon_start")?.cgImage
        cell.birthRate = 100 // 生成速度
        cell.lifetime = 5.0
        cell.color = UIColor.random().cgColor
        cell.alphaSpeed = -0.4 // 透明度衰减速度
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionRange = Double.pi * 2.0 // 粒子发射角度
        emitter.emitterCells = [cell]
    }
    

}
