//
//  AdItem.swift
//  AdManager
//
//  Created by An Nguyen on 01/07/2021.
//

import Foundation

open class AdItem {

    public var id: String

    public init(_ id: String) {
        self.id = id
    }

    open func isLoaded() -> Bool {
        false
    }

    open func load(onLoaded: @escaping OnAction, onError: @escaping OnError) {}

    open func release() {}

}
