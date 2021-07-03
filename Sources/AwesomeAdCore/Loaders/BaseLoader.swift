//
//  BaseAdLoader.swift
//  AdManager
//
//  Created by An Nguyen on 01/07/2021.
//

import Foundation

public class BaseLoader<T: AdItem> {
    
    internal var events: [State: EventAction] = [:]
    internal var ads: [T] = []
    
    public init(_ ads: T...) {
        self.ads = ads
    }
    
    public init() {
        self.ads = []
    }
    
    public func setAds(_ ads: T...) {
        self.ads = ads
    }
    
    internal func emitEvent(state: State) {
        if let action = events[state] {
            action()
        }
    }
    
    public func onAdLoaded(action: @escaping EventAction) {
        self.events[State.Loaded] = action
    }
    
    public func onAdFailedToLoad(action: @escaping EventAction) {
        self.events[State.LoadError] = action
    }
    
    public func onAdDismiss(action: @escaping EventAction) {
        self.events[State.Dismiss] = action
    }
    
    public func onAdFailedToShow(action: @escaping EventAction) {
        self.events[State.ShowError] = action
    }
    
    internal func getLoadedAdItem() -> T? {
        ads.first { ad in
            ad.isLoaded()
        }
    }
    
    public func isAdLoaded() -> Bool {
        return getLoadedAdItem() != nil
    }
    
    public func load() {
        load(ads: ads)
    }
    
    internal func getTag() -> String {
        return "AdLoader"
    }
    
    internal func load(ads: [T]) {
        ads.forEach { $0.release() }
        if let ad = ads.first {
            ad.load { [weak self] in
                print(self?.getTag(), "Ad loaded. Provider=\(ad)}")
                self?.emitEvent(state: .Loaded)
            } onError: { [weak self] error in
                debugPrint(self?.getTag(), "Ad load failed: \(error)")
                if (ads.count > 1) {
                    self?.load(ads: Array(ads.dropFirst()))
                } else {
                    self?.emitEvent(state: .LoadError)
                }
            }
        }
    }
    
}
