//
//  Extensions.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 26/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func stringWithCommasToInt() -> Int {
        let myString = self.replacingOccurrences(of: ",", with: "")
        return Int(myString) ?? 1
    }
    func stringToInt() -> Int {
        return Int(self) ?? 1
    }
}

extension Float {
    func roundToDecimal(fractionDigits: Int) -> Float {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * Float(multiplier)) / Float(multiplier)
    }
}
