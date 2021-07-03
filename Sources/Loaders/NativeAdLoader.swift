//
//  NativeAdLoader.swift
//  AdManagerCore
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import UIKit

public class NativeAdLoader: BaseLoader<NativeAdItemProvider> {
    
    public func getNativeAdView() -> UIView? {
        guard let ad = getLoadedAdItem() else { return nil }
        let adViewContainer = ad.getAdContainer()
        adViewContainer.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        let nativeView = NativeAdTemplate(frame: .zero)
        adViewContainer.addSubview(nativeView)
        adViewContainer.addConstraints([
            NSLayoutConstraint(item: adViewContainer, attribute: .top, relatedBy: .equal, toItem: nativeView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: adViewContainer, attribute: .leading, relatedBy: .equal, toItem: nativeView, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: adViewContainer, attribute: .trailing, relatedBy: .equal, toItem: nativeView, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: adViewContainer, attribute: .bottom, relatedBy: .equal, toItem: nativeView, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        ad.setHeadlineView(nativeView.textHeadline)
        ad.setBodyView(nativeView.textBody)
        ad.setMediaView(nativeView.mediaViewContainer)
        ad.setIconView(view: nativeView.imageIcon)
        ad.setCallToActionView(nativeView.buttonCallToAction)
        
        ad.onFinalizeAd()
        
        return adViewContainer
    }
}
