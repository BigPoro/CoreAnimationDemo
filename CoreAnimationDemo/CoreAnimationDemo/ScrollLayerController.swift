//
//  ScrollLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/7.
//

import UIKit

class ScrollView: UIView {
    override class var layerClass: AnyClass {
        return CAScrollLayer.self
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        self.layer.masksToBounds = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan))
        self.addGestureRecognizer(pan)
    }
    @objc func pan(recognizer:UIPanGestureRecognizer) {
        var offset = self.bounds.origin
        offset.x -= recognizer.translation(in: self).x
        offset.y -= recognizer.translation(in: self).y
        
        self.layer.scroll(offset)
        recognizer.setTranslation(CGPoint.zero, in: self)
    }
}


class ScrollLayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        guard let imgPath = Bundle.main.path(forResource: "img_snow_man_four", ofType: "jpeg") else {
            return
        }
        guard let img = UIImage(contentsOfFile: imgPath) else { return }
        let imageView = UIImageView(image: img)
        imageView.frame = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        
        let width = 200.0
        let x  = (self.view.frame.size.width - width) / 2.0
        let y = (self.view.frame.size.height - width) / 2.0
        let scrollView = ScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = CGRect(x: x, y: y, width: width, height: width)
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
    }
    

    

}
