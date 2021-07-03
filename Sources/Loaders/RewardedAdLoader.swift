//
//  RewardedAdLoader.swift
//  AdManagerCore
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import UIKit

public class RewardedAdLoader: BaseLoader<RewardedAdItem> {
    
    private var isReceiveReward: Bool = false
    
    public func onReward(_ action: @escaping EventAction) {
        events[State.Rewarded] = action
    }
    
    public override func load() {
        isReceiveReward = false
        super.load()
    }
    
    public func show(from viewController: UIViewController) {
        if let ad = getLoadedAdItem() {
            ad.show(from: viewController) { [weak self] in
                self?.isReceiveReward = true
            } onDismiss: { [weak self] in
                if (self?.isReceiveReward == true) {
                    self?.emitEvent(state: .Rewarded)
                } else {
                    self?.emitEvent(state: .Dismiss)
                }
            } onFailedToShow: { [weak self] error in
                debugPrint(self?.getTag(), "Failed to show rewarded ad")
                self?.emitEvent(state: .ShowError)
            }

        }
    }
}
