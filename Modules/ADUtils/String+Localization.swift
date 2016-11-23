//
//  String+Localization.swift
//  BabolatPulse
//
//  Created by Benjamin Lavialle on 06/09/16.
//
//

import Foundation

extension String {

    public var localizedUppercaseString: String {
        return uppercaseStringWithLocale(NSLocale.currentLocale())
    }

    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
