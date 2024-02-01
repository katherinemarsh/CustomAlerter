//
//  AlertEnvironment.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI

struct PresentedAlertEnvironmentKey: EnvironmentKey {
    static let defaultValue: Binding<CustomAlert?> = .constant(nil)
}

extension EnvironmentValues {
    var presentedAlert: Binding<CustomAlert?> {
        get { self[PresentedAlertEnvironmentKey.self] }
        set { self[PresentedAlertEnvironmentKey.self] = newValue }
    }
}

