//
//  AlertPresenter.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI

struct AlertPresenter<Content: View>: View {
    @State private var alert: CustomAlert?

    private let content: Content

    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }

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
            .environment(\.presentedAlert, alert)
            .environment(\.setAlert) { newValue in
                withAnimation(.easeInOut(duration: 0.3)) {
                    alert = newValue
                }
            }
    }
}
