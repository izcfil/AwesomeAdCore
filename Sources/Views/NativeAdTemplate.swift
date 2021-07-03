//
//  NativeAdTemplateView.swift
//  AdManagerCore
//
//  Created by An Nguyen on 02/07/2021.
//

import UIKit

public class NativeAdTemplate: UIView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var mediaViewContainer: UIView!
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var textHeadline: UILabel!
    @IBOutlet weak var textBody: UILabel!
    
    @IBOutlet weak var labelAdAttributes: UILabel!
    @IBOutlet weak var buttonCallToAction: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.module.loadNibNamed("NativeAdTemplate", owner: self, options: nil)
        addSubview(contentView)
        self.addConstraints([
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 350)
        ])
    }
}
