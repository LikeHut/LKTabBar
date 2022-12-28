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
        "基础样式", "自定义样式", "控制器嵌套样式", "选中状态动画效果", "提醒样式及动画效果"
    ]
    
    let titleArray = [
        ["默认样式", "只有图片", "只有文字"],
        ["更改文字默认颜色 / 选中颜色", "更改默认背景颜色 / 选中背景颜色", "自定义单个 tabBarItem 默认颜色 / 选中颜色", "自定义单个 tabBarItem 默认背景颜色 / 选中背景颜色", "自定义单个 tabBarItem 图片大小 / 图片偏移位置", "显示 tabBar 顶部线条"],
        ["UINavigationController -> UITabBarController 样式", "UITabBarController -> UINavigationController 样式"],
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
                self.present(DemoProvider.basicDefaultType(), animated: true)
            case 1:
                self.present(DemoProvider.basicOnlyImageType(), animated: true)
            case 2:
                self.present(DemoProvider.basicOnlyTitleType(), animated: true)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                self.present(DemoProvider.customChangeTitleColorType(), animated: true)
            case 1:
                self.present(DemoProvider.customChangeBackgroundColorType(), animated: true)
            case 2:
                self.present(DemoProvider.customChangeOneItemTitleColorType(), animated: true)
            case 3:
                self.present(DemoProvider.customChangeOneItemBackgroundColorType(), animated: true)
            case 4:
                self.present(DemoProvider.customChangeOneItemImageSizeType(), animated: true)
            case 5:
                self.present(DemoProvider.customShowTabBarTopLineType(), animated: true)
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                self.present(DemoProvider.navigationWithTabBarStyle(), animated: true)
            case 1:
                self.present(DemoProvider.tabBarWithNavigationStyle(), animated: true)
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                self.present(DemoProvider.selectedAnimationRotationXType(), animated: true)
            case 1:
                self.present(DemoProvider.selectedAnimationRotationYType(), animated: true)
            case 2:
                self.present(DemoProvider.selectedAnimationZoominType(), animated: true)
            case 3:
                self.present(DemoProvider.selectedAnimationZoomoutType(), animated: true)
            case 4:
                self.present(DemoProvider.selectedAnimationScaleType(), animated: true)
            default:
                break
            }
        case 4:
            switch indexPath.row {
            case 0:
                self.present(DemoProvider.remindMultipleType(), animated: true)
            case 1:
                self.present(DemoProvider.remindAnimationShakeType(), animated: true)
            case 2:
                self.present(DemoProvider.remindAnimationOpacityType(), animated: true)
            case 3:
                self.present(DemoProvider.remindAnimationScaleType(), animated: true)
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
