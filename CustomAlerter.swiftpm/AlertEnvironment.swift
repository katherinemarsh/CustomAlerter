//
//  AlertEnvironment.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI
import OSLog

struct PresentedAlertEnvironmentKey: EnvironmentKey {
    static let defaultValue: CustomAlert? = nil
}

private enum SetAlertEnvironmentKey: EnvironmentKey {
    static var defaultValue: (CustomAlert?) -> Void = { _ in
        Logger().warning("SetAlert action has not been configured on this environment")
    }
}

extension EnvironmentValues {
    var setAlert: (CustomAlert?) -> Void {
        get { self[SetAlertEnvironmentKey.self] }
        set { self[SetAlertEnvironmentKey.self] = newValue }
    }

    var presentedAlert: CustomAlert? {
        get { self[PresentedAlertEnvironmentKey.self] }
        set { self[PresentedAlertEnvironmentKey.self] = newValue }
    }
}
