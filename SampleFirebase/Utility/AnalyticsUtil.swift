//
//  Analytics.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/05/10.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAnalytics

class AnalyticsUtil {
    static func send(event: String , paramters: [String: Any]? = nil) {
        Analytics.logEvent(event, parameters: paramters)
    }
}
