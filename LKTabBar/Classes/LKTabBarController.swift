//
//  LKTabBarController.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit

open class LKTabBarController: UITabBarController {
    
    open var config: LKTabBarConfig = LKTabBarConfig() {
        didSet {
            guard let tabBar = self.tabBar as? LKTabBar else {
                return
            }
            tabBar.config = config
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTabBar()
    }

    // 将系统 tabBar 替换为自定义 LKTabBar 类型
    open func setupTabBar() {
        let tabBar: LKTabBar = LKTabBar()
        tabBar.delegate = self
        tabBar.customDelegate = self
        
        self.setValue(tabBar, forKey: "tabBar")
        
        self.addObserver(self, forKeyPath: "selectedIndex", options: [.old, .new], context: nil)
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "selectedIndex")
    }
    
    // KVO 观察 item 选择情况
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "selectedIndex" else {
            return
        }
        guard let selectedIndex = change?[NSKeyValueChangeKey.newKey] as? NSInteger else {
            return
        }
        guard let tabBar = self.tabBar as? LKTabBar else {
            return
        }
        tabBar.selectedIndex = selectedIndex
    }
}

// MARK: - UITabBarDelegate 实现
extension LKTabBarController {
    public override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        if let tabBar = tabBar as? LKTabBar {
            tabBar.updateLayout()
        }
    }
    
    public override func tabBar(_ tabBar: UITabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) {
        if let tabBar = tabBar as? LKTabBar {
            tabBar.updateLayout()
        }
    }
    
    public override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item) else {
            return
        }
        
        if let vc = viewControllers?[index] {
            delegate?.tabBarController?(self, didSelect: vc)
            selectedIndex = index
        }
    }
}

// MARK: - LKTabBarDelegate 代理实现
extension LKTabBarController: LKTabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelectIndex selectedIndex: NSInteger) {
        self.selectedIndex = selectedIndex
    }
}
