//
//  BXTranslationAnimationVC.swift
//  BXCABasicAnimationDemo
//
//  Created by Oboe_b on 2017/9/9.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

import UIKit

class BXTranslationAnimationVC: UIViewController {
    lazy var animationIM:UIImageView = { return UIImageView() }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "Translation Animation"
        // Do any additional setup after loading the view.
        self.setTranslationAnimation()
    }
   func setTranslationAnimation()  {
    // exampleT
        animationIM.image = UIImage(named: "exampleT")
        view.addSubview(animationIM)
        animationIM.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.left.equalTo(20)
            make.top.equalTo(100)
        }
        self.loadRotationAnimation(toValue: animationIM.frame.origin.x+UIScreen.main.bounds.size.width, myImageView: animationIM)
    
    
   }
   private func loadRotationAnimation(toValue : Any?, myImageView : UIImageView) {
        let  translationAnimation = CABasicAnimation(keyPath: "transform.translation")
        translationAnimation.duration = 2
        translationAnimation.toValue = toValue
        translationAnimation.isCumulative = true
        translationAnimation.repeatCount = 1//执行次数
        translationAnimation.isRemovedOnCompletion = false;
//        translationAnimation.fillMode = kCAFillModeForwards;
        translationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)//匀速
        myImageView.layer.add(translationAnimation, forKey: "transform.translation")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.loadRotationAnimation(toValue: animationIM.frame.origin.x+UIScreen.main.bounds.size.width, myImageView: animationIM)
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
