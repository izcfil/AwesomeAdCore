//
//  InterstitialAdItem.swift
//  AdManager
//
//  Created by An Nguyen on 01/07/2021.
//

import Foundation
import UIKit

open class InterstitialAdItem: AdItem {
    
    public override init(_ id: String) {
        super.init(id)
    }
    
    open func show(from viewController: UIViewController, onDismiss: OnAction? = nil, onFailedToShow: OnError? = nil) {
        
        fatalError("Method is not initialized")
    }
    
    open override func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {
        fatalError("Method is not initialized")
    }
}

open class InterstitialAd<T>: InterstitialAdItem {
    
    public var ad: T? = nil
    
    public override init(_ id: String) {
        super.init(id)
    }
    
    open override func isLoaded() -> Bool {
        return ad != nil
    }
    
    open override func release() {
        ad = nil
    }
    
    open func getAdInstance() -> T {
        return ad!
    }
    
    open override func show(from viewController: UIViewController, onDismiss: OnAction? = nil, onFailedToShow: OnError? = nil) {
        fatalError("Method is not initialized")
    }
    
    open override func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {
        fatalError("Method is not initialized")
    }
}
