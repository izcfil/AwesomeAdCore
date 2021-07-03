//
//  Events.swift
//  AdManager
//
//  Created by An Nguyen on 01/07/2021.
//

import Foundation

enum State {
    case Loaded
    case LoadError
    case Dismiss
    case ShowError
    case Rewarded
}

public typealias EventAction = () -> Void
