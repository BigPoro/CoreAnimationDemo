//
//  ViewController.swift
//  CoreAnimationDemo
//
//  Created by iDog on 2022/9/5.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

class ViewController: UITableViewController {
    var dataSource = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CoreAnimationDemo"
        dataSource = ["Contents","CustomDrawing","Shadow","LCDClock","SolidObject","ShapeLayer","TextLayer","TransformLayer","GradientLayer","ReplicatorLayer","ScrollLayer","TiledLayer","EmitterLayer","隐式动画","渲染树与模型树","关键帧动画","MediaTiming","自定义缓冲函数","基于关键帧的缓冲","矢量图形"]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier);
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier);
        }
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell;
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ContentsController.init(), animated: true)
        case 1:
            self.navigationController?.pushViewController(CustomDrawingController.init(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ShadowController.init(), animated: true)
        case 3:
            self.navigationController?.pushViewController(LCDClockController.init(), animated: true)
        case 4:
            self.navigationController?.pushViewController(SolidObjectController.init(), animated: true)
        case 5:
            self.navigationController?.pushViewController(ShapeLayerController.init(), animated: true)
        case 6:
            self.navigationController?.pushViewController(TextLayerController.init(), animated: true)
        case 7:
            self.navigationController?.pushViewController(TransformLayerController.init(), animated: true)
        case 8:
            self.navigationController?.pushViewController(GradientLayerController.init(), animated: true)
        case 9:
            self.navigationController?.pushViewController(ReplicatorLayerController.init(), animated: true)
        case 10:
            self.navigationController?.pushViewController(ScrollLayerController.init(), animated: true)
        case 11:
            self.navigationController?.pushViewController(TiledLayerController.init(), animated: true)
        case 12:
            self.navigationController?.pushViewController(EmitterLayerController.init(), animated: true)
        case 13:
            self.navigationController?.pushViewController(AnimationAffairscController.init(), animated: true)
        case 14:
            self.navigationController?.pushViewController(RenderModelController.init(), animated: true)
        case 15:
            self.navigationController?.pushViewController(KeyframeAnimationController.init(), animated: true)
        case 16:
            self.navigationController?.pushViewController(MediaTimingController.init(), animated: true)
        case 17:
            self.navigationController?.pushViewController(CustomMediaTimingController.init(), animated: true)
        case 18:
            self.navigationController?.pushViewController(KeyFrameMediaTimingController.init(), animated: true)
        case 19:
            self.navigationController?.pushViewController(VectorGraphicsController.init(), animated: true)
        default:
            break
        }
    }
}

