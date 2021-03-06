//
//  Sequence+Utils.swift
//  ADUtils
//
//  Created by Pierre Felgines on 24/09/2018.
//

import Foundation

public extension Sequence {

    /**
     Groups elements into a dictionary.

     - parameter grouping: A function that maps elements into a `Hashable` type.

     - returns: A dictionary where each key contains all the elements of `self` that are mapped to the key
     via the `grouping` function.
     */
    func ad_groupedBy<U: Hashable>(grouping: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self {
            let key = grouping(element)
            categories[key] = categories[key] ?? []
            categories[key]?.append(element)
        }
        return categories
    }
}
