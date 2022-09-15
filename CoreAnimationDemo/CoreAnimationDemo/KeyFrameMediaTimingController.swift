//
//  KeyFrameMediaTimingController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/14.
//

import UIKit

class KeyFrameMediaTimingController: UIViewController, CAAnimationDelegate {
    private let snowmanView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        guard let imgPath = Bundle.main.path(forResource: "img_snow_man", ofType: "jpeg") else {
            return
        }
        let img = UIImage(contentsOfFile: imgPath)
        snowmanView.image = img
        snowmanView.frame.size = CGSize(width: 100, height: 100)
        self.view.addSubview(snowmanView)
        snowmanView.center = CGPoint(x: 150,y: 50);
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        animate()
    }
    
    func animate() {
        snowmanView.center = CGPoint(x: 150,y: 50);
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.delegate = self
        animation.values = [NSValue(cgPoint: CGPoint(x: 150, y: 50)),
                            NSValue(cgPoint: CGPoint(x: 150, y: 300)),
                            NSValue(cgPoint: CGPoint(x: 150, y: 200)),
                            NSValue(cgPoint: CGPoint(x: 150, y: 250)),
                            NSValue(cgPoint: CGPoint(x: 150, y: 150)),
                            NSValue(cgPoint: CGPoint(x: 150, y: 100)),
                            NSValue(cgPoint: CGPoint(x: 150, y: 300))]
        animation.timingFunctions = [
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn)
        ];
        animation.keyTimes = [NSNumber(value: 0.0),
                              NSNumber(value: 0.3),
                              NSNumber(value: 0.5),
                              NSNumber(value: 0.7),
                              NSNumber(value: 0.8),
                              NSNumber(value: 0.9),
                              NSNumber(value: 0.95),
                              NSNumber(value: 1.0)]
        snowmanView.layer.position = CGPoint(x: 150, y: 300)
        snowmanView.layer.add(animation, forKey: nil)
        
    }
    
    
}
