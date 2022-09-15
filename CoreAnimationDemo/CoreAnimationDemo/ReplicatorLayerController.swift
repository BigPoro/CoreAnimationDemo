//
//  ReplicatorLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/6.
//

import UIKit

class ReflectionView: UIView {
    override class var layerClass: AnyClass {
        return CAReplicatorLayer.self
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        guard let layer = self.layer as? CAReplicatorLayer else { return }
        layer.instanceCount = 2
        
        var transform = CATransform3DIdentity
        let offset = self.bounds.size.height
        transform = CATransform3DTranslate(transform, 0, offset, 0)
        transform = CATransform3DScale(transform, 1, -1, 0)
        layer.instanceTransform = transform
        layer.instanceAlphaOffset = -0.5
    }
}

class ReplicatorLayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        let width = 100.0
        let y = (self.view.frame.size.height - width) / 2.0
        
        let view = ReflectionView(frame: CGRect(x: 100, y: y, width: width, height: width))
        guard let imgPath = Bundle.main.path(forResource: "img_snow_man", ofType: "jpeg") else {
            return
        }
        // 添加自视图
        guard let img = UIImage(contentsOfFile: imgPath) else { return }
        let imageView = UIImageView(image: img)
        imageView.frame = view.bounds
        view.addSubview(imageView)
        
        self.view.addSubview(view)
        
//        repeatingLayers()
    }
    
    func repeatingLayers() {
        let containerView = UIView()
        
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        containerView.frame = CGRect(x: x, y: y, width: width, height: width)
        self.view.addSubview(containerView)
        
        let replicator = CAReplicatorLayer()
        replicator.frame = containerView.bounds
        containerView.layer.addSublayer(replicator)
        // 重复次数
        replicator.instanceCount = 15
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, 200, 0)
        transform = CATransform3DRotate(transform, Double.pi/5, 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -200, 0)
        replicator.instanceTransform = transform
        // 改变颜色通道实现变换颜色
        replicator.instanceBlueOffset = -0.1
        replicator.instanceGreenOffset = -0.1
        // 添加子图层
        guard let imgPath = Bundle.main.path(forResource: "img_snow_man", ofType: "jpeg") else {
            return
        }
        // 添加自视图
        guard let img = UIImage(contentsOfFile: imgPath) else { return }
        
        let subLayer = CALayer()
        subLayer.contents = img.cgImage
        subLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        subLayer.backgroundColor = UIColor.white.cgColor
        replicator.addSublayer(subLayer)
    }

}
