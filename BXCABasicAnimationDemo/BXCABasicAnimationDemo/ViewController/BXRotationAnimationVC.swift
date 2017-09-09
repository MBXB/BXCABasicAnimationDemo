//
//  BXRotationAnimationVC.swift
//  BXCABasicAnimationDemo
//
//  Created by 毕向北 on 2017/7/9.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

import UIKit
import SnapKit
class BXRotationAnimationVC: UIViewController {
    lazy var withincircularIM:UIImageView = { return UIImageView() }()
    lazy var circularIM:UIImageView = { return UIImageView() }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "Rotation Animation"
        self.setRotationAnimation()
    }
    func setRotationAnimation()  {
        withincircularIM.image = UIImage(named: "innerRing")
        view.addSubview(withincircularIM)
        withincircularIM.snp.makeConstraints({ (make) in
            make.center.equalTo(self.view)
        })
        circularIM.image = UIImage(named: "outerRing")
        view.addSubview(circularIM)
        circularIM.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        self.loadRotationAnimation(toValue: (Double.pi*2), myImageView: circularIM)
        self.loadRotationAnimation(toValue: -(Double.pi*2), myImageView: withincircularIM)
    }
    private func loadRotationAnimation(toValue : Any?, myImageView : UIImageView) {
        let clockwiserotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        clockwiserotationAnimation.toValue = toValue
        clockwiserotationAnimation.duration = 3
        clockwiserotationAnimation.isCumulative = true
        clockwiserotationAnimation.repeatCount = 10000;
        myImageView.layer.add(clockwiserotationAnimation, forKey: "rotationAnimation")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
