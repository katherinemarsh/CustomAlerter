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
    @Environment(\.presentedAlert) private var presentedAlert

    @Binding var alert: CustomAlert?

    func body(content: Content) -> some View {
        content
            .onChange(of: alert) {
                presentedAlert.wrappedValue = alert
            }
            .onChange(of: presentedAlert.wrappedValue) { oldValue, newValue in
                if newValue == nil && alert == oldValue {
                    alert = nil
                }
            }
            .onAppear {
                if alert != nil {
                    presentedAlert.wrappedValue = alert
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
