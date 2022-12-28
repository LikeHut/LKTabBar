//
//  LKTabBarItemBadge.swift
//  LKTabBar
//
//  Created by Walking Boy on 11/22.
//

import UIKit

open class LKTabBarItemBadge: UIView {

    open var badgeColor: UIColor? = UIColor(red: 255.0/255.0, green: 59.0/255.0, blue: 48.0/255.0, alpha: 1.0) {
        didSet {
            imageView.backgroundColor = badgeColor
        }
    }
    
    /// Image view
    open var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    open var badgeValue: String? {
        didSet {
            badgeLabel.text = badgeValue
        }
    }
    
    /// 显示  badgeValue 的 Label
    open var badgeLabel: UILabel = {
        let badgeLabel = UILabel.init(frame: CGRect.zero)
        badgeLabel.backgroundColor = .clear
        badgeLabel.textColor = .white
        badgeLabel.font = UIFont.systemFont(ofSize: 13.0)
        badgeLabel.textAlignment = .center
        return badgeLabel
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.addSubview(badgeLabel)
        self.imageView.backgroundColor = badgeColor
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let badgeValue = badgeValue else {
            imageView.isHidden = true
            badgeLabel.isHidden = true
            return
        }
        
        imageView.isHidden = false
        badgeLabel.isHidden = false
        let size = bounds.size
        if badgeValue == "" {
            imageView.frame = CGRect(x: (size.width - 8.0) / 2.0, y: (size.height - 8.0) / 2.0, width: 8.0, height: 8.0)
        } else {
            imageView.frame = bounds
        }
        
        imageView.layer.cornerRadius = imageView.bounds.size.height / 2.0
        badgeLabel.sizeToFit()
        badgeLabel.center = imageView.center
    }
    
    // 根据 badgeValue 计算需要占用父视图大小，重写此方法可以自定义 badge 视图大小
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let _ = badgeValue else {
            return CGSize(width: 18.0, height: 18.9)
        }
        let textSize = badgeLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        return CGSize.init(width: max(18.0, textSize.width + 10.0), height: 18.0)
    }
}
