//
//  BXScaleAnimationVC.swift
//  BXCABasicAnimationDemo
//
//  Created by Oboe_b on 2017/9/9.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

import UIKit

class BXScaleAnimationVC: UIViewController {
    lazy var animationIM:UIImageView = { return UIImageView() }()
    lazy var bigIM:UIImageView = { return UIImageView() }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "Scale Animation"
        // Do any additional setup after loading the view.
        self.setScaleAnimation()
    }
    func setScaleAnimation()  {
        animationIM.image = UIImage(named: "example")
        view.addSubview(animationIM)
        animationIM.snp.makeConstraints { (make) in
            make.width.height.equalTo(10)
            make.center.equalTo(view)
        }
        self.loadRotationAnimation(toValue: 20.0, myImageView: animationIM)
        
    }
    private func loadRotationAnimation(toValue : Any?, myImageView : UIImageView) {
        let  scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 3
        scaleAnimation.toValue = toValue
        scaleAnimation.isCumulative = true
        scaleAnimation.repeatCount = 1//执行次数
        scaleAnimation.isRemovedOnCompletion = false;
        scaleAnimation.fillMode = kCAFillModeForwards;
        myImageView.layer.add(scaleAnimation, forKey: "transform.scale")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
