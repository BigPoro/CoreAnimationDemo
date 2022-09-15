//
//  TextLayerController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/6.
//

import UIKit

class TextLayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        let containerView = UIView()
        containerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        containerView.center = self.view.center
        containerView.backgroundColor = .white
        self.view.addSubview(containerView)
        
        let textLayer = CATextLayer()
        textLayer.frame = containerView.bounds
        containerView.layer.addSublayer(textLayer)
        
        textLayer.foregroundColor = UIColor.random().cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode.justified
        textLayer.isWrapped = true
        // 设置字体
        let font = UIFont.systemFont(ofSize: 15)
        let cgFont = CGFont(font.fontName as CFString)!
        textLayer.font = cgFont
        textLayer.fontSize = font.pointSize
        
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel  fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet  lobortis"

        textLayer.string = text
        textLayer.contentsScale = UIScreen.main.scale;
    }

}
