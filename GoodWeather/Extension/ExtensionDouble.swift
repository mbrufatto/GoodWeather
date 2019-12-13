//
//  ExtensionDouble.swift
//  GoodWeather
//
//  Created by Marcio Brufatto on 13/12/19.
//  Copyright © 2019 Marcio Brufatto. All rights reserved.
//

import Foundation

extension Double {
    
    var formatAsDegree: String {
        return String(format: "%.0fº", self)
    }
}
