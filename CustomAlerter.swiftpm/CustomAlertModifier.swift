//
//  CustomAlertModifier.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI

/// Modifier that allows any view wrapped within a top-level AlertPresenter wrapper to present an alert
/// Binds to an alert set from the view and listens for updates
private struct CustomAlertModifier: ViewModifier {
    @Environment(\.setAlert) private var setAlert
    @Environment(\.presentedAlert) private var presentedAlert

    @Binding var alert: CustomAlert?

    func body(content: Content) -> some View {
        content
            .onChange(of: alert) {
                // if the user triggers an alert to appear ex. button press, business logic
                // then set that alert value in the environment to be read from the parent AlertPresenter
                // and displayed or hidden the top-level
                setAlert(alert)
            }
            .onChange(of: presentedAlert) { oldValue, newValue in
                // if the user manually dismisses an alert from the top-level alert view
                // we need to update the state of the view where the alert was originally set
                // to preserve the correct state if the user re-triggers the alert
                if newValue == nil && alert == oldValue {
                    alert = newValue
                }
            }
            .onAppear {
                // for cases where the alert is populated by default
                // on appear is needed, as on change is not triggered
                if alert != nil {
                    setAlert(alert)
                }
            }
    }
}

extension View {
    func customAlert(
        _ alert: Binding<CustomAlert?>
    ) -> some View {
        modifier(
            CustomAlertModifier(alert: alert)
        )
    }
}
