//
//  TileView.swift
//  ModAutoLayout1
//
//  Created by Encompass on 8/28/19.
//  Copyright © 2019 gcharplaytime. All rights reserved.
//

import UIKit

@IBDesignable
class TileView: UIView {

   @IBInspectable var padding: CGFloat = 25.0 {
        didSet {
            setNeedsLayout()
        }
    }

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        addSubview(blueView)
        addSubview(redView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let containerWidth = bounds.width
        let containerHeight = bounds.height
        
        let numberOfItems: CGFloat = 2
        let itemWidth = (containerWidth - (numberOfItems + 1) * padding) / numberOfItems
        let itemHeight = containerHeight - 2 * padding
        
        
        blueView.frame = CGRect(x: padding, y: padding, width: itemWidth, height: itemHeight)
        redView.frame = CGRect(x: 2 * padding + itemWidth, y: padding, width: itemWidth, height: itemHeight)
    }
   
}
