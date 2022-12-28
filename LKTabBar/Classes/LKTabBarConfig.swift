//
//  LKTabBarConfig.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit

// item 选中状态动画类型
public enum LKTabBarItemSelectedAnimationType : Int, @unchecked Sendable {
    case none = 0        // 默认无动画效果
    case rotationX = 1   // 绕 X 轴旋转效果
    case rotationY = 2   // 绕 Y 轴旋转效果
    case zoomin = 3      // 放大效果
    case zoomout = 4     // 缩小效果
    case scale = 5       // 缩放效果
}

// badge 赋值状态动画类型
public enum LKTabBarItemBadgeShowAnimationType: Int, @unchecked Sendable {
    case none = 0        // 默认无动画效果
    case shake = 1       // 抖动效果
    case opacity = 2     // 透明
    case scale = 3       // 缩放效果
}

open class LKTabBarConfig: NSObject {
    // MARK: - tabBar 相关设置
    
    // tabBar 背景颜色（默认白色）
    open var tabBarBackgroundColor: UIColor = .white
    // tabBar 顶部线条颜色（默认亮灰色）
    open var tabBarTopLineColor: UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1)
    // tabBar 显示顶部线条（默认不显示）
    open var showTabBarTopLine: Bool = false
    
    
    // MARK: - tabBarItem 相关设置
    
    // tabBarItem 默认状态下标题颜色
    open var normalTitleColor: UIColor = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1)
    // tabBarItem 选中状态下标题颜色
    open var selectedTitleColor: UIColor = UIColor(red: 0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
    // tabBarItem 默认状态下背景颜色（默认无颜色）
    open var normalBackgroundColor: UIColor = .clear
    // tabBarItem 选中状态下背景颜色（默认无颜色）
    open var selectedBackgroundColor: UIColor = .clear
    // tabbarItem 选中状态下动画效果（默认无动画效果）
    open var selectedAnimationType: LKTabBarItemSelectedAnimationType = .none
    
    
    // MARK: - badgeValue 自定义设置
    
    // badgeValue 的背景颜色
    open var badgeColor: UIColor = UIColor(red: 255.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1.0)
    // badgeValue 的文字颜色（默认 FFFFFF）
    open var badgeTextColor: UIColor = UIColor(white: 1, alpha: 1)
    // badgeValue 的偏移量
    open var badgeOffset: UIOffset = UIOffset(horizontal: 6.0, vertical: -22.0)
    // badgeValue 的动画显示效果（默认无动画效果）
    open var badgeAnimationType: LKTabBarItemBadgeShowAnimationType = .none
}
