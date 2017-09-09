//
//  ViewController.swift
//  BXCABasicAnimationDemo
//
//  Created by 毕向北 on 2017/7/9.
//  Copyright © 2017年 MBXB-bifujian. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private let itemsTitles: [String] = ["Rotation Animation","Scale Animation","Translation Animation"]
    private var viewControllers: [UIViewController] {
        get {
            return [BXRotationAnimationVC(),BXScaleAnimationVC(),BXTranslationAnimationVC()]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let backIetm = UIBarButtonItem();
        backIetm.title = "";
        self.navigationItem.backBarButtonItem = backIetm;
        self.navigationItem.title = "Basic Animation"
        self.setMyTableview()
    }
    private func setMyTableview() {
        let mainTableView = UITableView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        mainTableView.rowHeight = 50;
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(mainTableView)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsTitles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemsTitles[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(viewControllers[indexPath.row], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

