//
//  NativeAdItem.swift
//  AdManager
//
//  Created by An Nguyen on 01/07/2021.
//

import Foundation
import UIKit

open class NativeAdItemProvider: AdItem {

    open override func isLoaded() -> Bool {
        super.isLoaded()
    }
    
    open func getAdContainer() -> UIView {
        return UIView(frame: .zero)
    }
    
    open func setHeadlineView(_ view: UILabel) {}
    open func setBodyView(_ view: UILabel) {}
    open func setMediaView(_ view: UIView){}
    open func setCallToActionView(_ view: UIButton){}
    open func setIconView(view: UIImageView){}
    open func onFinalizeAd() {}
}

open class NativeAdItem<T>: NativeAdItemProvider {
    
    public var ad: T? = nil
    
    open override func isLoaded() -> Bool {
        ad != nil
    }
    
    open func getAdInstance() -> T {
        ad!
    }
    
    open override func getAdContainer() -> UIView {
        super.getAdContainer()
    }
    
    open override func release() {
        ad = nil
    }
}
