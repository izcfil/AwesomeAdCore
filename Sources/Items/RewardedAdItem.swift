//
//  RewardedAdItem.swift
//  AdManagerCore
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import UIKit

open class RewardedAdItem: AdItem {
    open func show(from viewController: UIViewController, onReward: OnAction?, onDismiss: OnAction?, onFailedToShow: OnError?) {
        fatalError("Need implement")
    }
    
    public override func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {
        fatalError("Need implement")
    }
}

open class RewardAd<T>: RewardedAdItem {
    open var ad: T? = nil
    open override func isLoaded() -> Bool {
        return ad != nil
    }
    
    open override func show(from viewController: UIViewController, onReward: OnAction?, onDismiss: OnAction?, onFailedToShow: OnError?) {
        fatalError("Need implement")
    }
    
    open override func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {
        fatalError("Need implement")
    }
    
    open override func release() {
        ad = nil
    }
}
