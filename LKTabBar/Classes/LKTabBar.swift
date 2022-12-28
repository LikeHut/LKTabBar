//
//  LKTabBar.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit

// MARK: - LKTabBarDelegate
// 对 UITabBarDelegate 进行扩展，以支持 UITabBarControllerDelegate 的相关方法桥接
internal protocol LKTabBarDelegate: NSObjectProtocol {

    func tabBar(_ tabBar: UITabBar, didSelectIndex selectedIndex: NSInteger)
}

open class LKTabBar: UITabBar {

    // tabBar 自定义 item 的容器
    internal var buttons = [LKTabBarItemButton]()
    
    weak var customDelegate: LKTabBarDelegate?
    
    lazy internal var topLineView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 1))
    
    open var config: LKTabBarConfig = LKTabBarConfig() {
        didSet {
            self.reload()
        }
    }
    
    open var selectedIndex: NSInteger = 0 {
        didSet {
            self.setupSelectedIndex(selectedIndex: selectedIndex)
        }
    }
    
    open override var items: [UITabBarItem]? {
        didSet {
            self.reload()
        }
    }
    
    open override func setItems(_ items: [UITabBarItem]?, animated: Bool) {
        super.setItems(items, animated: animated)
        self.reload()
    }
    
    open override func beginCustomizingItems(_ items: [UITabBarItem]) {
        #if DEBUG
            print("beginCustomizingItems(_:) is unsupported in ESTabBar.")
        #endif
        super.beginCustomizingItems(items)
    }
    
    open override func endCustomizing(animated: Bool) -> Bool {
        #if DEBUG
            print("endCustomizing(_:) is unsupported in ESTabBar.")
        #endif
        return super.endCustomizing(animated: animated)
    }
    
    internal func removeAll() {
        for button in buttons {
            button.removeFromSuperview()
        }
        buttons.removeAll()
        if let _ = self.topLineView.superview {
            self.topLineView.removeFromSuperview()
        }
    }
    
    internal func reload() {
        self.removeAll()
        
        self.updateDisplay()
        
        self.updateLayout()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.updateLayout()
    }
}

// MARK: - Display 和 Layout
extension LKTabBar {
    internal func updateDisplay() {
        self.backgroundColor = config.tabBarBackgroundColor
        
        guard let tabBarItems = self.items else {
            #if DEBUG
                print("tabBarItems is empty error.")
            #endif
            return
        }
        
        for (idx, item) in tabBarItems.enumerated() {
            if let item = item as? LKTabBarItem {
                item.button.tag = 1000 + idx
                if item.normalTitleColor == nil {
                    item.button.normalTitleColor = config.normalTitleColor
                }
                if item.selectedTitleColor == nil {
                    item.button.selectedTitleColor = config.selectedTitleColor
                }
                if item.normalBackgroundColor == nil {
                    item.button.normalBackgroundColor = config.normalBackgroundColor
                }
                if item.selectedBackgroundColor == nil {
                    item.button.selectedBackgroundColor = config.selectedBackgroundColor
                }
                
                item.button.badgeShowAnimationDelegate = self
                
                self.addSubview(item.button)
                self.buttons.append(item.button)
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectAction(_ :)))
                item.button.addGestureRecognizer(tapGesture)
            }
        }
        
        if config.showTabBarTopLine {
            self.addSubview(self.topLineView)
            topLineView.backgroundColor = config.tabBarTopLineColor
        }
    }
    
    internal func updateLayout() {
        guard self.items != nil else {
            #if DEBUG
                print("tabBarItems is empty error.")
            #endif
            return
        }
        
        let tabBarButtons = subviews.filter { subview -> Bool in
            if let cls = NSClassFromString("UITabBarButton") {
                return subview.isKind(of: cls)
            }
            return false
            } .sorted { (subview1, subview2) -> Bool in
                return subview1.frame.origin.x < subview2.frame.origin.x
        }
        
        for (idx, button) in buttons.enumerated(){
            if !tabBarButtons[idx].frame.isEmpty {
                var buttonFrame = tabBarButtons[idx].frame
                buttonFrame.origin.y += button.itemEdgeInsets.top
                buttonFrame.origin.x += button.itemEdgeInsets.left
                buttonFrame.size.height += button.itemEdgeInsets.bottom
                buttonFrame.size.width += button.itemEdgeInsets.right
                button.frame = buttonFrame
            }
        }
        
        if let _ = self.topLineView.superview {
            self.topLineView.frame = CGRectMake(0, 0, self.bounds.size.width, 1)
        }
    }
}

// MARK: - LKTabBarItem 点击选中相关
extension LKTabBar {
    @objc func selectAction(_ sender: AnyObject?) {
        guard let tapGesture = sender as? UITapGestureRecognizer else {
            return
        }
        
        guard let view = tapGesture.view as? LKTabBarItemButton else {
            return
        }
        
        guard let selectedIndex = self.buttons.firstIndex(of: view) else {
            return
        }
        
        self.setupSelectedIndex(selectedIndex: selectedIndex)
        
        customDelegate?.tabBar(self, didSelectIndex: selectedIndex)
    }
    
    func setupSelectedIndex(selectedIndex: NSInteger) {
        for (idx, button) in buttons.enumerated() {
            if idx == selectedIndex {
                button.selected = true
                if selectedIndex != self.selectedIndex {
                    selectedAnimateWithView(view: button.imageView, type: config.selectedAnimationType)
                }
            } else {
                button.selected = false
            }
        }
    }
    
    // LKTabBarItem 点击选中动画
    private func selectedAnimateWithView(view: UIView, type: LKTabBarItemSelectedAnimationType) {
        switch type {
        case .none:
            break
        case .rotationX:
            let rotationXAnima = CABasicAnimation(keyPath: "transform.rotation.x")
            rotationXAnima.duration = 0.2
            rotationXAnima.toValue = Double.pi
            rotationXAnima.repeatCount = 1
            rotationXAnima.autoreverses = true
            view.layer.add(rotationXAnima, forKey: nil)
        case .rotationY:
            let rotationYAnima = CABasicAnimation(keyPath: "transform.rotation.y")
            rotationYAnima.duration = 0.2
            rotationYAnima.toValue = Double.pi
            rotationYAnima.repeatCount = 1
            rotationYAnima.autoreverses = true
            view.layer.add(rotationYAnima, forKey: nil)
        case .zoomin:
            let zoominAnima = CABasicAnimation(keyPath: "bounds.size")
            zoominAnima.duration = 0.2
            zoominAnima.toValue = NSValue(cgPoint: CGPoint(x: 30, y: 30))
            zoominAnima.repeatCount = 1
            zoominAnima.autoreverses = true
            view.layer.add(zoominAnima, forKey: nil)
        case .zoomout:
            let zoomoutAnima = CABasicAnimation(keyPath: "bounds.size")
            zoomoutAnima.duration = 0.2
            zoomoutAnima.toValue = NSValue(cgPoint: CGPoint(x: 18, y: 18))
            zoomoutAnima.repeatCount = 1
            zoomoutAnima.autoreverses = true
            view.layer.add(zoomoutAnima, forKey: nil)
        case .scale:
            let scaleAnima = CAKeyframeAnimation(keyPath: "transform.scale")
            scaleAnima.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
            scaleAnima.calculationMode = CAAnimationCalculationMode.cubicPaced
            scaleAnima.duration = 0.6
            scaleAnima.isRemovedOnCompletion = true
            view.layer.add(scaleAnima, forKey: nil)
        }
    }
    
    // 扩大 LKTabBarItem 点击范围
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var flag = super.point(inside: point, with: event)
        if !flag {
            for subview in self.subviews {
                if subview.point(inside: CGPoint.init(x: point.x - subview.frame.origin.x, y: point.y - subview.frame.origin.y), with: event) {
                    flag = true
                }
            }
        }
        return flag
    }
}

// MARK: - badge 值改变时的动画效果代理实现
extension LKTabBar: LKTabBarItemBadgeShowAnimationDelegate {
    func buttonBadgeChanged(_ button: LKTabBarItemButton) {
        badgeShowAnimationWithView(view: button.badgeView, type: config.badgeAnimationType)
    }
    
    private func angle2Rad(_ angle: CGFloat) -> CGFloat {
        return angle / 180.0 * Double.pi
    }
    
    // badgeValue 的动画显示效果
    private func badgeShowAnimationWithView(view: UIView, type: LKTabBarItemBadgeShowAnimationType) {
        switch type {
        case .none:
            break
        case .shake:
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
            animation.values = [angle2Rad(-15.0), angle2Rad(-10.0), angle2Rad(-7.0), angle2Rad(-5.0), angle2Rad(0), angle2Rad(5.0), angle2Rad(-7.0), angle2Rad(10.0), angle2Rad(15.0)]
            animation.repeatCount = 5
            animation.autoreverses = true
            view.layer.add(animation, forKey: nil)
        case .opacity:
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 1.0
            animation.toValue = 0.2
            animation.repeatCount = 3
            animation.duration = 0.3
            animation.autoreverses = true
            view.layer.add(animation, forKey: nil)
        case .scale:
            let animation = CAKeyframeAnimation(keyPath: "transform.scale")
            animation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
            animation.duration = 0.6
            animation.calculationMode = CAAnimationCalculationMode.cubicPaced
            view.layer.add(animation, forKey: nil)
        }
    }
}
