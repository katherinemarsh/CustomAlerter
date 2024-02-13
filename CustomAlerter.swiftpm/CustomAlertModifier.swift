//
//  CustomAlertModifier.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI

private struct CustomAlertModifier: ViewModifier {
    @Environment(\.presentedAlert) private var presentedAlert

    @Binding var alert: CustomAlert?

    func body(content: Content) -> some View {
        content
            .onChange(of: alert) { _ in
                presentedAlert.wrappedValue = alert
            }
            .onChange(of: presentedAlert.wrappedValue) { newValue in
                if newValue == nil {
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
        modifier(CustomAlertModifier(alert: alert))
    }
}
