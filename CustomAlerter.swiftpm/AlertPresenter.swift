//
//  AlertPresenter.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI

struct AlertPresenter<Content: View>: View {
    @State private var alert: CustomAlert?

    @ViewBuilder let content: Content

    var body: some View {
        content
            .overlay {
                if alert != nil {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .transition(.opacity)
                }
            }
            .overlay {
                if alert != nil {
                    CustomAlertView(alert: $alert)
                        .transition(
                            .scale(scale: 0.85)
                            .combined(with: .opacity)
                        )
                }
            }
            .animation(.easeInOut(duration: 0.3), value: alert)
            .environment(\.presentedAlert, $alert)
    }
}
