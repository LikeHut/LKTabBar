//
//  DemoViewController.swift
//  LKTabBar_Example
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let redRandom = Float.random(in: 0...1)
        let greenRandom = Float.random(in: 0...1)
        let blueRandom = Float.random(in: 0...1)
        self.view.backgroundColor = UIColor(red: CGFloat(redRandom), green: CGFloat(greenRandom), blue: CGFloat(blueRandom), alpha: 1)
        
        let size = self.view.bounds.size
        let titleFrame = CGRect(x: 50, y: size.height / 2.0 - 50, width: size.width - 100, height: 20)
        let titleLabel = UILabel(frame: titleFrame)
        titleLabel.text = "点击空白处退出示例样式"
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.systemFont(ofSize: 18.0)
        titleLabel.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
        self.view.addSubview(titleLabel)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
}
