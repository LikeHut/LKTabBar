//
//  ViewController.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit
import LKTabBar

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Example"
    }
    
    let sectionTitleArray = [
        "基础样式", "自定义样式", "选中状态动画效果", "提醒样式及动画效果"
    ]
    
    let titleArray = [
        ["默认样式", "只有图片", "只有文字"],
        ["更改文字默认颜色 / 选中颜色", "更改默认背景颜色 / 选中背景颜色", "自定义单个 tabBarItem 图片大小"],
        ["绕 X 轴旋转效果", "绕 Y 轴旋转效果", "放大效果", "缩小效果", "缩放效果"],
        ["多种提醒样式", "提醒抖动效果", "提醒透明渐变效果", "提醒缩放效果"]
    ]
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.textColor = UIColor(white: 0.0, alpha: 0.6)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
        cell.textLabel?.lineBreakMode = .byCharWrapping
        cell.textLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1) \(titleArray[indexPath.section][indexPath.row])"
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                self.present(self.basicDefaultType(), animated: true)
            case 1:
                self.present(self.basicOnlyImageType(), animated: true)
            case 2:
                self.present(self.basicOnlyTitleType(), animated: true)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                self.present(self.customChangeTitleColorType(), animated: true)
            case 1:
                self.present(self.customChangeBackgroundColorType(), animated: true)
            case 2:
                self.present(self.customChangeOneItemImageSizeType(), animated: true)
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                self.present(self.selectedAnimationRotationXType(), animated: true)
            case 1:
                self.present(self.selectedAnimationRotationYType(), animated: true)
            case 2:
                self.present(self.selectedAnimationZoominType(), animated: true)
            case 3:
                self.present(self.selectedAnimationZoomoutType(), animated: true)
            case 4:
                self.present(self.selectedAnimationScaleType(), animated: true)
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                self.present(self.remindMultipleType(), animated: true)
            case 1:
                self.present(self.remindAnimationShakeType(), animated: true)
            case 2:
                self.present(self.remindAnimationOpacityType(), animated: true)
            case 3:
                self.present(self.remindAnimationScaleType(), animated: true)
            default:
                break
            }
        default:
            break
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}

extension ViewController {
    // MARK: - 基础样式
    
    // 默认样式
    internal func basicDefaultType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 只有图片
    internal func basicOnlyImageType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 只有文字
    internal func basicOnlyTitleType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: nil, selectedImage: nil, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: nil, selectedImage: nil, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: nil, selectedImage: nil, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: nil, selectedImage: nil, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: nil, selectedImage: nil, tag: 4)
        
        let config =  LKTabBarConfig()
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
        
    
    // MARK: - 自定义样式

    // 更改文字默认颜色 / 选中颜色
    internal func customChangeTitleColorType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.normalTitleColor = .darkGray
        config.selectedTitleColor = .red
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 更改默认背景颜色 / 选中背景颜色
    internal func customChangeBackgroundColorType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.normalBackgroundColor = .gray
        config.selectedBackgroundColor = .darkGray
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 自定义单个 tabBarItem 图片大小
    internal func customChangeOneItemImageSizeType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        let item3 = LKTabBarItem.init(title: "", image: UIImage(named: "add-plus")!, selectedImage: UIImage(named: "add-plus")!, tag: 2)
        item3.imageSize = CGSize(width: 72, height: 72)
        item3.itemEdgeInsets = UIEdgeInsets(top: -26, left: 0, bottom: 0, right: 0)
        
        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = item3
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    
    // MARK: - 选中状态动画效果
    
    // 选中绕 X 轴旋转效果
    internal func selectedAnimationRotationXType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .rotationX
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 选中绕 Y 轴旋转效果
    internal func selectedAnimationRotationYType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .rotationY
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 选中放大效果
    internal func selectedAnimationZoominType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .zoomin
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 选中缩小效果
    internal func selectedAnimationZoomoutType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .zoomout
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 选中缩放效果
    internal func selectedAnimationScaleType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        let config =  LKTabBarConfig()
        config.selectedAnimationType = .scale
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }

    
    // MARK: - 提醒样式及动画效果
    
    // 多种提醒样式
    internal func remindMultipleType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        vc3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            vc1.tabBarItem.badgeValue = "New"
            vc2.tabBarItem.badgeValue = "99+"
            vc3.tabBarItem.badgeValue = "1"
            vc4.tabBarItem.badgeValue = ""
            vc5.tabBarItem.badgeValue = nil
        }

        let config =  LKTabBarConfig()

        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 提醒抖动效果
    internal func remindAnimationShakeType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        vc3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            vc1.tabBarItem.badgeValue = "New"
            vc2.tabBarItem.badgeValue = "99+"
            vc3.tabBarItem.badgeValue = "1"
            vc4.tabBarItem.badgeValue = ""
            vc5.tabBarItem.badgeValue = nil
        }
        
        let config =  LKTabBarConfig()
        config.badgeAnimationType = .shake
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 提醒透明渐变效果
    internal func remindAnimationOpacityType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()

        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        vc3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            vc1.tabBarItem.badgeValue = "New"
            vc2.tabBarItem.badgeValue = "99+"
            vc3.tabBarItem.badgeValue = "1"
            vc4.tabBarItem.badgeValue = ""
            vc5.tabBarItem.badgeValue = nil
        }
        
        let config =  LKTabBarConfig()
        config.badgeAnimationType = .opacity
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
    
    // 提醒缩放效果
    internal func remindAnimationScaleType() -> LKTabBarController {
        let vc1 = DemoViewController()
        let vc2 = DemoViewController()
        let vc3 = DemoViewController()
        let vc4 = DemoViewController()
        let vc5 = DemoViewController()
        
        vc1.tabBarItem = LKTabBarItem.init(title: "首页", image: UIImage(named: "home-normal")!, selectedImage: UIImage(named: "home-selected")!, tag: 0)
        vc2.tabBarItem = LKTabBarItem.init(title: "书架", image: UIImage(named: "shelf-normal")!, selectedImage: UIImage(named: "shelf-selected")!, tag: 1)
        vc3.tabBarItem = LKTabBarItem.init(title: "日历", image: UIImage(named: "calendar-normal")!, selectedImage: UIImage(named: "calendar-selected")!, tag: 2)
        vc4.tabBarItem = LKTabBarItem.init(title: "功能", image: UIImage(named: "more-normal")!, selectedImage: UIImage(named: "more-selected")!, tag: 3)
        vc5.tabBarItem = LKTabBarItem.init(title: "设置", image: UIImage(named: "setting-normal")!, selectedImage: UIImage(named: "setting-selected")!, tag: 4)
        
        vc3.tabBarItem.badgeColor = .blue
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // 模拟延时收到提醒
            vc1.tabBarItem.badgeValue = "New"
            vc2.tabBarItem.badgeValue = "99+"
            vc3.tabBarItem.badgeValue = "1"
            vc4.tabBarItem.badgeValue = ""
            vc5.tabBarItem.badgeValue = nil
        }
        
        let config =  LKTabBarConfig()
        config.badgeAnimationType = .scale
        
        let tabBarController = LKTabBarController(config: config)
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        return tabBarController
    }
}
