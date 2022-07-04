//
//  FirebasePerformance.swift
//  Mathlet
//
//  Created by Lee Danatech on 2022/7/2.
//  Copyright © 2022 Danatech. All rights reserved.
//

import Foundation
import FirebasePerformance

class MLTPerformance {

    enum PerformanceKey: String, Equatable {
        case open = "open"
        case newCity = "new_city"
        case newSection = "new_section"
        case iapProducts = "iap_products"
        case remoteConfig = "remote_config"
        case vippageRedirect = "vippageRedirect"
        case openProfile = "open_profile"
    }

    // MARK: - Properties
    static let shared = MLTPerformance()

    lazy var events: [PerformanceKey: Trace] = [:]

    private init() {
    }

    class func traceStart(_ key: PerformanceKey) {
        shared.events[key]?.stop()
        shared.events[key] = Performance.startTrace(name: key.rawValue)
    }

    class func traceEnd(_ key: PerformanceKey) {
        shared.events[key]?.stop()
        shared.events[key] = nil
    }
}
