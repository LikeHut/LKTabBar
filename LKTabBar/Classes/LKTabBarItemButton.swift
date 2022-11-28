//
//  LKTabBarItemButton.swift
//  LKTabBar
//
//  Created by ITCharge on 11/22/2022.
//  Copyright (c) 2022 ITCharge. All rights reserved.
//

import UIKit

/// 主要实现 badge 值改变时的动画效果
internal protocol LKTabBarItemButtonDelegate: NSObjectProtocol {

    func buttonBadgeChanged(_ button: LKTabBarItemButton)
}

public class LKTabBarItemButton: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(badgeView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var customDelegate: LKTabBarItemButtonDelegate?

    open var selected:Bool = false {
        didSet {
            self.imageView.image = selected ? self.selectedImage : self.normalImage
            self.titleLabel.textColor = selected ? self.selectedTitleColor : self.normalTitleColor
            self.backgroundColor = selected ? self.selectedBackgroundColor : self.normalBackgroundColor
        }
    }
    
    /// The title displayed on the item, default is `nil`
    open var title: String? {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    /// The image used to represent the item, default is `nil`
    open var normalImage: UIImage?
    
    /// The image displayed when the tab bar item is selected, default is `nil`.
    open var selectedImage: UIImage?
    
    open var imageSizeValue: NSValue?
    
    open var normalTitleColor: UIColor?
    
    open var selectedTitleColor: UIColor?
    
    open var normalBackgroundColor: UIColor?
    
    open var selectedBackgroundColor: UIColor?
    
    public var itemEdgeInsets: UIEdgeInsets = .zero
    
    open var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    open var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect.zero)
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.systemFont(ofSize: 10.0)
        titleLabel.textColor = .clear
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    /// badgeValue, default is `nil`.
    open var badgeValue: String? {
        didSet {
            if let _ = badgeValue {
                self.badgeView.badgeValue = badgeValue
                self.addSubview(badgeView)
                self.setNeedsLayout()
            } else {
                // remove when nil.
                self.badgeView.removeFromSuperview()
            }
            customDelegate?.buttonBadgeChanged(self)
        }
    }
    
    /// badgeView, default is `ESTabBarItemBadgeView()`.
    open var badgeView: LKTabBarItemBadge = LKTabBarItemBadge() {
        willSet {
            if let _ = badgeView.superview {
                badgeView.removeFromSuperview()
            }
        }
        didSet {
            if let _ = badgeView.superview {
                self.setNeedsLayout()
            }
        }
    }
    
    /// Badge offset, default is `UIOffset(horizontal: 6.0, vertical: -22.0)`.
    open var badgeOffset: UIOffset = UIOffset(horizontal: 6.0, vertical: -22.0) {
        didSet {
            if badgeOffset != oldValue {
                self.setNeedsLayout()
            }
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.isHidden = (imageView.image == nil)
        titleLabel.isHidden = (titleLabel.text == nil)
        
        let size = self.bounds.size
        
        var imageSize: CGSize
        var imageX: CGFloat
        var imageY: CGFloat
        
        var fontSize: CGFloat = 12.0
        let titleH: CGFloat = 14.0
        var titleW: CGFloat
        var titleX: CGFloat
        var titleY: CGFloat
        
        
        var isLandscape = false
        if let keyWindow = UIApplication.shared.keyWindow {
            isLandscape = keyWindow.bounds.width > keyWindow.bounds.height
        }
        let isWide = isLandscape || traitCollection.horizontalSizeClass == .regular
        
        if imageSizeValue == nil {
            if #available(iOS 11.0, *), isWide {
                imageSize = UIScreen.main.scale == 3.0 ? CGSize(width: 23, height: 23) : CGSize(width: 20, height: 20)
                fontSize = UIScreen.main.scale == 3.0 ? 13.0 : 12.0
            } else {
                imageSize = CGSize(width: 23, height: 23)
                fontSize = 10.0
            }
        } else {
            imageSize = imageSizeValue?.cgSizeValue ?? CGSize(width: 23, height: 23)
        }
        
        
        if !imageView.isHidden && !titleLabel.isHidden {
            titleLabel.font = UIFont.systemFont(ofSize: fontSize)
            titleLabel.sizeToFit()
            
            if #available(iOS 11.0, *), isWide {
                
                titleW = titleLabel.bounds.size.width
                
                imageX = (size.width - imageSize.width - titleW - 5.0) / 2.0
                imageY = (size.height - imageSize.height) / 2.0
                
                titleX = imageX + 5.0 + imageSize.width
                titleY = (size.height - titleH) / 2.0
                
                imageView.frame = CGRect(x: imageX, y: imageY, width: imageSize.width, height: imageSize.height)
                titleLabel.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
            } else {
                titleW = size.width - 8.0
                
                imageX = (size.width - imageSize.width) / 2.0
                imageY = 4.0
                
                titleX = 4.0
                titleY = size.height - titleH - 1.0
                
                imageView.frame = CGRect(x: imageX, y: imageY, width: imageSize.width, height: imageSize.height)
                titleLabel.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
            }
        } else if !imageView.isHidden {
            imageX = (size.width - imageSize.width) / 2.0
            imageY = (size.height - imageSize.height) / 2.0
            
            imageView.frame = CGRect(x: imageX, y: imageY, width: imageSize.width, height: imageSize.height)
        } else if !titleLabel.isHidden {
            titleLabel.font = UIFont.systemFont(ofSize: fontSize)
            titleLabel.sizeToFit()
            
            titleW = titleLabel.bounds.size.width
            
            titleX = (size.width - titleLabel.bounds.size.width) / 2.0
            titleY = (size.height - titleH) / 2.0
                
            titleLabel.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
        }
        
        if let _ = badgeView.superview {
            let badgeViewSize = badgeView.sizeThatFits(self.frame.size)
            if #available(iOS 11.0, *), isWide {
                badgeView.frame = CGRect(x: imageView.frame.midX - 3 + badgeOffset.horizontal, y: imageView.frame.midY + 3 + badgeOffset.vertical, width: badgeViewSize.width, height: badgeViewSize.height)
            } else {
                badgeView.frame = CGRect(x: size.width / 2.0 + badgeOffset.horizontal, y: size.height / 2.0 + badgeOffset.vertical, width: badgeViewSize.width, height: badgeViewSize.height)
            }
            badgeView.setNeedsLayout()
        }
    }
}
