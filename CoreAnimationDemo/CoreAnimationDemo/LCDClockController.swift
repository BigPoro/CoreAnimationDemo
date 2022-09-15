//
//  LCDClockController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/5.
//

import UIKit

class LCDClockController: UIViewController {
    var digitViews = Array<UIView>()
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        guard let imgPath = Bundle.main.path(forResource: "img_number", ofType: "png") else {
            return
        }
        let img = UIImage(contentsOfFile: imgPath)
        
        for _ in 0..<7 {
            let view = UIView()
            view.layer.contents = img?.cgImage
            view.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.1, height: 1)
            view.layer.contentsScale = UIScreen.main.scale
            view.layer.contentsGravity = .resizeAspect
            self.view.addSubview(view)
            digitViews.append(view)
        }

        timer = Timer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)

        timer.fire()
        RunLoop.main.add(timer, forMode: .common)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let margin = 10.0;
        
        let width = (self.view.frame.size.width - margin * 7.0) / 6.0
        let y = (self.view.frame.size.height - width) / 2.0
        for i in 0..<digitViews.count {
            let view = digitViews[i]
            view.frame = CGRect(x: margin * Double(i + 1) + width * Double(i),y: y,width: width,height: width)
        }
    }
    
    @objc func tick() {
        let calendar = Calendar.init(identifier: .gregorian)
        let components = calendar.dateComponents([Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.year], from: Date.now)
        
        setDigit(digit: (components.hour ?? 0) / 10, view: digitViews[0])
        setDigit(digit: (components.hour ?? 0) % 10 , view: digitViews[1])
        
        setDigit(digit: (components.minute ?? 0) / 10, view: digitViews[2])
        setDigit(digit: (components.minute ?? 0) % 10 , view: digitViews[3])
        
        setDigit(digit: (components.second ?? 0) / 10, view: digitViews[4])
        setDigit(digit: (components.second ?? 0) % 10 , view: digitViews[5])
    }
    
    func setDigit(digit:Int,view:UIView) {
        view.layer.contentsRect = CGRect(x: Double(digit) * 0.1, y: 0, width: 0.1, height: 1)
    }
    

}
