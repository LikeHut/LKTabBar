//
//  LKTabBarController.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit

open class LKTabBarController: UITabBarController, LKTabBarDelegate {

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTabBar()
    }
    
    open var lk_tabBar: LKTabBar = {
        let tabBar = LKTabBar()
        return tabBar
    }()
        
    public init(config: LKTabBarConfig) {
        super.init(nibName: nil, bundle: nil)
        
        self.lk_tabBar.config = config
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 将系统 tabBar 替换为自定义 lk_tabBar
    open func setupTabBar() {
        self.lk_tabBar.frame = self.tabBar.frame
        self.lk_tabBar.customDelegate = self
        
        self.setValue(self.lk_tabBar, forKey: "tabBar")
        
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

        self.lk_tabBar.selectedIndex = selectedIndex
    }
    
    func tabBar(_ tabBar: UITabBar, didSelectIndex selectedIndex: NSInteger) {
        self.selectedIndex = selectedIndex
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
