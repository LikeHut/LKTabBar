//
//  LKTabBarItem.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit

open class LKTabBarItem: UITabBarItem {
    
    public init(title: String? = nil, image: UIImage?, selectedImage: UIImage?, tag: Int = 0) {
        super.init()
        if title != nil {
            self.button.title = title
        }
        if image != nil {
            self.button.normalImage = image
        }
        if selectedImage != nil {
            self.button.selectedImage = selectedImage
        }
        
        self.button.tag = tag
    }
    
    public var button: LKTabBarItemButton = LKTabBarItemButton()
    
    public override var badgeValue: String? {
        get {
            return button.badgeValue
        }
        set (newValue) {
            button.badgeValue = newValue
        }
    }
    
    public override var badgeColor: UIColor? {
        get {
            return button.badgeView.badgeColor
        }
        set (newValue) {
            button.badgeView.badgeColor = newValue
        }
    }
    
    open var normalTitleColor: UIColor? {
        didSet {
            self.button.normalTitleColor = normalTitleColor
        }
    }
    
    open var selectedTitleColor: UIColor? {
        didSet {
            self.button.selectedTitleColor = selectedTitleColor
        }
    }
    
    open var normalBackgroundColor: UIColor? {
        didSet {
            self.button.normalBackgroundColor = normalBackgroundColor
        }
    }
    
    open var selectedBackgroundColor: UIColor? {
        didSet {
            self.button.selectedBackgroundColor = selectedBackgroundColor
        }
    }
    
    open var imageSize: CGSize? {
        didSet {
            self.button.imageSizeValue = NSValue(cgSize: imageSize ?? CGSize(width: 23, height: 23))
        }
    }
    
    open override var title: String? {
        didSet {
            self.button.title = title
        }
    }
    
    open override var image: UIImage? {
        didSet {
            self.button.normalImage = image
        }
    }
    
    public override var selectedImage: UIImage? {
        didSet {
            self.button.selectedImage = image
        }
    }
    
    public var itemEdgeInsets: UIEdgeInsets = .zero {
        didSet {
            self.button.itemEdgeInsets = itemEdgeInsets
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
