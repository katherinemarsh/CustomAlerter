//
//  AlertEnvironment.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI
import OSLog

struct PresentedAlertEnvironmentKey: EnvironmentKey {
    static let defaultValue: String? = nil
}

private enum SetAlertEnvironmentKey: EnvironmentKey {
    static var defaultValue: (String?) -> Void = { _ in
        Logger().warning("SetAlert action has not been configured on this environment")
    }
}

extension EnvironmentValues {
    var setAlert: (String?) -> Void {
        get { self[SetAlertEnvironmentKey.self] }
        set { self[SetAlertEnvironmentKey.self] = newValue }
    }

    var presentedAlert: String? {
        get { self[PresentedAlertEnvironmentKey.self] }
        set { self[PresentedAlertEnvironmentKey.self] = newValue }
    }
}
