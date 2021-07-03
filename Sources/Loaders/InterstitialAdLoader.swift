//
//  InterstitialAdLoader.swift
//  AdManager
//
//  Created by An Nguyen on 01/07/2021.
//

import Foundation
import UIKit

public class InterstitialAdLoader: BaseLoader<InterstitialAdItem> {
    
    override func getTag() -> String {
        return "InterstitialAdLoader"
    }
    
    public func show(from viewController: UIViewController) {
        if let ad = getLoadedAdItem() {
            ad.show(from: viewController) { [weak self] in
                self?.emitEvent(state: .Dismiss)
            } onFailedToShow: { [weak self] error in
                debugPrint(self?.getTag(), "Failed to show interstitial ad", error)
                self?.emitEvent(state: .ShowError)
            }
        }
    }
}
