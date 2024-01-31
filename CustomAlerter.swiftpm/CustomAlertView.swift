//
//  CustomAlertView.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var alert: CustomAlert?

    var body: some View {
        if let alert {
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    if let icon = alert.icon {
                        icon
                            .resizable()
                            .scaledToFit()
                    }

                    Text(alert.title)
                        .font(.headline)

                    Text(alert.message)
                        .font(.subheadline)
                }

                VStack(spacing: 8) {
                    if let secondaryAction = alert.secondaryAction, let secondaryButtonText = alert.secondaryButtonText {
                        Button(secondaryButtonText) {
                            secondaryAction()
                            withAnimation(.easeInOut(duration: 0.3)) {
                                self.alert = nil
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }

                    Button(alert.primaryButtonText, role: .destructive) {
                        if let primaryAction = alert.primaryAction {
                            primaryAction()
                        }

                        withAnimation(.easeInOut(duration: 0.3)) {
                            self.alert = nil
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .multilineTextAlignment(.center)
            .padding(24)
            .background(.white)
            .cornerRadius(16)
            .overlay(alignment: .topTrailing) {
                if alert.showDismissButton {
                    dismissButton
                }
            }
            .padding(.horizontal, 24)
            .dynamicTypeSize(.xSmall ... .accessibility2)
        }
    }

    private var dismissButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.alert = nil
            }
        } label: {
            Label("dismiss", systemImage: "xmark")
                .labelStyle(.iconOnly)
                .font(.system(size: 16, weight: .bold))
        }
        .padding([.top, .trailing], 8)
    }
}

#Preview {
    CustomAlertView(alert: .constant(.genericWithRetry { }))
}
