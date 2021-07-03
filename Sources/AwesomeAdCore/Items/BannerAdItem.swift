//
//  BannerAdItem.swift
//  AdManager
//
//  Created by An Nguyen on 01/07/2021.
//

import Foundation
import UIKit

open class BannerAdItem: AdItem {
    public override init(_ id: String) {
        super.init(id)
    }
    
    open func getAdInstance() -> UIView? {
        fatalError()
    }
}

open class BannerAd<T>: BannerAdItem where T: UIView {
    
    public var ad: T? = nil
    
    public override init(_ id: String) {
        super.init(id)
    }
    
    open override func isLoaded() -> Bool {
        ad != nil
    }
    
    open override func getAdInstance() -> UIView? {
        return ad!
    }
    
    open override func release() {
        ad = nil
    }
}
