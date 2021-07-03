//
//  BannerAdLoader.swift
//  AdManagerCore
//
//  Created by An Nguyen on 02/07/2021.
//

import Foundation
import UIKit

public class BannerAdLoader: BaseLoader<BannerAdItem> {
    
    public func getBannerView() -> UIView? {
        return getLoadedAdItem()?.getAdInstance()
    }
    
    public override func getLoadedAdItem() -> BannerAdItem? {
        super.getLoadedAdItem()
    }
}
