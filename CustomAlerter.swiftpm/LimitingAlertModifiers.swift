//
//  LimitingAlertModifiers.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import SwiftUI

struct AlertWrapper: Identifiable, Hashable {
    let id = UUID()
    let message: String
}

extension View {
    func customAlerterFullScreen(_ alert: Binding<AlertWrapper?>) -> some View {
        self
            .fullScreenCover(item: alert) { alert in
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .overlay {
                        Text(alert.message)
                            .font(.headline)
                            .padding()
                            .background(.green)
                    }
            }
    }
}

extension View {
    func customAlerterZStack(_ alert: AlertWrapper?) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                if let alert {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .overlay {
                            Text(alert.message)
                                .font(.headline)
                                .padding()
                                .background(.green)
                        }
                }
            }
    }
}

private struct TransparentBackgroundViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    class ViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .clear
        }

        override func willMove(toParent parent: UIViewController?) {
            super.willMove(toParent: parent)
            parent?.view?.backgroundColor = .clear
            parent?.modalPresentationStyle = .overCurrentContext
        }
    }
}

public extension View {
    @available(*, deprecated, message: "Moving away from directly clearing view on parent.")
    func clearBackground() -> some View {
        background(TransparentBackgroundViewController())
    }
}
