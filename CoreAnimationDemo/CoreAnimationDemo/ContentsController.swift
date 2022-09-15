//
//  ContentsController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/5.
//

import UIKit
import Foundation

class ContentsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

//        contentGravity()
        contentsRect()
    }
 
    // contentGravity
    
    func contentGravity()  {
        let layerView = UIView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        layerView.backgroundColor = .white
        layerView.center = self.view.center
        self.view.addSubview(layerView)
        
        guard let imgPath = Bundle.main.path(forResource: "img_snow_man", ofType: "jpeg") else {
            return
        }
        let img = UIImage(contentsOfFile: imgPath)
        layerView.layer.contents = img!.cgImage;
//        layerView.layer.contentsGravity = .center
//        layerView.layer.contentsScale = UIScreen.main.scale
        
        // 相当于上面两行
        layerView.layer.contentsGravity = .resizeAspect
    }
    // contentsRect
    
    func contentsRect() {
        guard let imgPath = Bundle.main.path(forResource: "img_snow_man_four", ofType: "jpeg") else {
            return
        }
        guard let img = UIImage(contentsOfFile: imgPath) else { return }
        
        let snowOne = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        snowOne.backgroundColor = .white
        self.view.addSubview(snowOne)
        addSpriteImage(img: img, rect: CGRect(x: 0, y: 0, width: 0.25, height: 1), superLayer: snowOne.layer)
        
        let snowTwo = UIView.init(frame: CGRect(x: 150, y: 150, width: 100, height: 100))
        snowTwo.backgroundColor = .white
        self.view.addSubview(snowTwo)
        addSpriteImage(img: img, rect: CGRect(x: 0.25, y: 0, width: 0.25, height: 1), superLayer: snowTwo.layer)
        
        let snowThree = UIView.init(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
        snowThree.backgroundColor = .white
        self.view.addSubview(snowThree)
        addSpriteImage(img: img, rect: CGRect(x: 0.5, y: 0, width: 0.25, height: 1), superLayer: snowThree.layer)

        
        let snowFour = UIView.init(frame: CGRect(x: 150, y: 450, width: 100, height: 100))
        snowFour.backgroundColor = .white
        self.view.addSubview(snowFour)
        addSpriteImage(img: img, rect: CGRect(x: 0.75, y: 0, width: 0.25, height: 1), superLayer: snowFour.layer)

    }
    
    func addSpriteImage(img:UIImage, rect:CGRect, superLayer:CALayer) {
        superLayer.contents = img.cgImage
        superLayer.contentsGravity = .resizeAspect
        superLayer.contentsRect = rect
    }
    
    
}
