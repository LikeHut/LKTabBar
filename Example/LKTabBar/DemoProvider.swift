//
//  DemoProvider.swift
//  LKTabBar_Example
//
//  Created by ITCharge on 2022/12/28.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import LKTabBar

enum DemoProvider {
    // MARK: - 基础样式
    
    // 默认样式
    static func basicDefaultType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 只有图片
    static func basicOnlyImageType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 只有文字
    static func basicOnlyTitleType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: nil, selectedImage: nil, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: nil, selectedImage: nil, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: nil, selectedImage: nil, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: nil, selectedImage: nil, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: nil, selectedImage: nil, tag: 4)
        
        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
        
    
    // MARK: - 自定义样式

    // 更改文字默认颜色 / 选中颜色
    static func customChangeTitleColorType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.normalTitleColor = .darkGray
        config.selectedTitleColor = .red
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 更改默认背景颜色 / 选中背景颜色
    static func customChangeBackgroundColorType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.normalBackgroundColor = .gray
        config.selectedBackgroundColor = .darkGray
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 自定义单个 tabBarItem 默认颜色 / 选中颜色（单个 tabBarItem 优先级 > 全局 config 优先级）
    static func customChangeOneItemTitleColorType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        let tabBarItem3 = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        tabBarItem3.normalTitleColor = .green
        tabBarItem3.selectedTitleColor = .orange
        v3.tabBarItem = tabBarItem3
        
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 自定义单个 tabBarItem 默认背景颜色 / 选中背景颜色（单个 tabBarItem 优先级 > 全局 config 优先级）
    static func customChangeOneItemBackgroundColorType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        let tabBarItem3 = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        tabBarItem3.normalBackgroundColor = .gray
        tabBarItem3.selectedBackgroundColor = .darkGray
        v3.tabBarItem = tabBarItem3
        
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 自定义单个 tabBarItem 图片大小 / 图片偏移位置
    static func customChangeOneItemImageSizeType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        let tabBarItem3 = LKTabBarItem.init(title: "", image: UIImage(named: "add-plus")!, selectedImage: UIImage(named: "add-plus")!, tag: 2)
        tabBarItem3.imageSize = CGSize(width: 72, height: 72)
        tabBarItem3.itemEdgeInsets = UIEdgeInsets(top: -26, left: 0, bottom: 0, right: 0)
        v3.tabBarItem = tabBarItem3
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 显示 tabBar 顶部线条
    static func customShowTabBarTopLineType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.showTabBarTopLine = true
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    
    // MARK: - 控制器嵌套样式
    
    // UINavigationController -> UITabBarController 样式
    static func navigationWithTabBarStyle() -> UINavigationController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()
        
        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        tabBarController.title = "UINavigationController -> UITabBarController"
        
        let navigationController = UINavigationController.init(rootViewController: tabBarController)
        return navigationController
    }
    
    // UITabBarController -> UINavigationController 样式
    static func tabBarWithNavigationStyle() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()
        
        v1.title = "首页"
        v2.title = "书架"
        v3.title = "日历"
        v4.title = "功能"
        v5.title = "设置"
        
        let n1 = UINavigationController(rootViewController: v1)
        let n2 = UINavigationController(rootViewController: v2)
        let n3 = UINavigationController(rootViewController: v3)
        let n4 = UINavigationController(rootViewController: v4)
        let n5 = UINavigationController(rootViewController: v5)
        
        n1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        n2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        n3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        n4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        n5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)

        let tabBarController = LKTabBarController()
        tabBarController.config = LKTabBarConfig()
        tabBarController.viewControllers = [n1, n2, n3, n4, n5]
        
        return tabBarController
    }
    
    
    // MARK: - 选中状态动画效果
    
    // 选中绕 X 轴旋转效果
    static func selectedAnimationRotationXType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .rotationX
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 选中绕 Y 轴旋转效果
    static func selectedAnimationRotationYType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .rotationY
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 选中放大效果
    static func selectedAnimationZoominType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .zoomin
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 选中缩小效果
    static func selectedAnimationZoomoutType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .zoomout
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 选中缩放效果
    static func selectedAnimationScaleType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .scale
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }

    
    // MARK: - 提醒样式及动画效果
    
    // 多种提醒样式
    static func remindMultipleType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        v3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            v1.tabBarItem.badgeValue = "New"
            v2.tabBarItem.badgeValue = "99+"
            v3.tabBarItem.badgeValue = "1"
            v4.tabBarItem.badgeValue = ""
            v5.tabBarItem.badgeValue = nil
        }

        let config =  LKTabBarConfig()

        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 提醒抖动效果
    static func remindAnimationShakeType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        v3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            v1.tabBarItem.badgeValue = "New"
            v2.tabBarItem.badgeValue = "99+"
            v3.tabBarItem.badgeValue = "1"
            v4.tabBarItem.badgeValue = ""
            v5.tabBarItem.badgeValue = nil
        }
        
        let config =  LKTabBarConfig()
        config.badgeAnimationType = .shake
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 提醒透明渐变效果
    static func remindAnimationOpacityType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()

        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        v3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            v1.tabBarItem.badgeValue = "New"
            v2.tabBarItem.badgeValue = "99+"
            v3.tabBarItem.badgeValue = "1"
            v4.tabBarItem.badgeValue = ""
            v5.tabBarItem.badgeValue = nil
        }
        
        let config =  LKTabBarConfig()
        config.badgeAnimationType = .opacity
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    // 提醒缩放效果
    static func remindAnimationScaleType() -> LKTabBarController {
        let v1 = DemoViewController()
        let v2 = DemoViewController()
        let v3 = DemoViewController()
        let v4 = DemoViewController()
        let v5 = DemoViewController()
        
        v1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        v2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        v3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        v4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        v5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        v3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            v1.tabBarItem.badgeValue = "New"
            v2.tabBarItem.badgeValue = "99+"
            v3.tabBarItem.badgeValue = "1"
            v4.tabBarItem.badgeValue = ""
            v5.tabBarItem.badgeValue = nil
        }
        
        let config =  LKTabBarConfig()
        config.badgeAnimationType = .scale
        
        let tabBarController = LKTabBarController()
        tabBarController.config = config
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
}
