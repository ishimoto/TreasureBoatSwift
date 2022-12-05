//
//  Rollbar.swift
//  
//
//  Created by Ken Ishimoto on 2022/12/04.
//

import Foundation


/* Rollbar NOT WORKING  */

// https://github.com/rollbar/rollbar-apple.git
// [Rollbar] The app possibly was recycled due to Out-of-Memory problem (FOOM).

//            let accessToken = "451c35ba6db14ffb97b0ae5214c207c9" // Rollbar post_client_item access token
//            let environment = "development"
//            let codeVersion = "main"  // Ideally codeVersion is commit SHA https://docs.rollbar.com/docs/versions
//
//            let config = RollbarConfig.mutableConfig(withAccessToken: accessToken, environment: environment)
//            config.loggingOptions.codeVersion = codeVersion
//
//            // Suppress Rollbar event being logged (e.g. in XCode debug logs)
//            config.developerOptions.suppressSdkInfoLogging = true
//
//            config.telemetry.enabled = true
//            config.telemetry.captureLog = true
//            config.telemetry.maximumTelemetryData = 10
//
//            config.modifyRollbarData = Rollbar.transform(payload:)
//
//            // optionally add data about the user to improve error response
//            config.person.id = "12345"
//
//            // additional custom data to add to every occurrence sent
//            config.customData = ["customer_type": "enterprise"]
//
//            Rollbar.initWithConfiguration(config)
//
//            // Note the ability to add aditional key/value pairs to the occurrence data for extra context
//            Rollbar.infoMessage(
//                "Rollbar is up and running! Enjoy your remote error and log monitoring...",
//                data: ["key_x": "value_x", "key_y": "value_y"])

//extension Rollbar {
//    /// `return true` means DO NOT send the data to Rollbar (i.e. ignore)
//    /// `return false` means DO send the data to Rollbar
//    static func shouldIgnore(payload: RollbarData) -> Bool {
//        return false
//    }
//
//    /// Transform the occurrence payload just before the data is sent.
//    ///
//    /// This allows data to be added/removed from the payload basd on some
//    /// aspect of the payload data.
//    ///
//    /// This method is often used to do advanced data scrubbing or to add
//    /// additional data to the payload that is only available at the time
//    /// the error occurs.
//    static func transform(payload: RollbarData) -> RollbarData {
//        // Context is an indexed fast search field in the Rollbar Web UI
//        //
//        // The items timeline view can be filtered by context
//        // https://docs.rollbar.com/docs/search-items#context
//        payload.context = "owner#ui_team"
//
//        return payload
//    }
//}
