//
//  CustomAlert.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 1/30/24.
//

import Foundation
import SwiftUI

struct CustomAlert: Equatable {
    let icon: Image?
    let title: String
    let message: String
    let primaryButtonText: String
    let primaryAction: (() -> Void)?
    let secondaryButtonText: String?
    let secondaryAction: (() -> Void)?
    let showDismissButton: Bool

    init(
        icon: Image? = nil,
        title: String,
        message: String,
        primaryButtonText: String,
        secondaryButtonText: String? = nil,
        primaryAction: (() -> Void)? = nil,
        secondaryAction: (() -> Void)? = nil,
        showDismissButton: Bool = false
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.primaryButtonText = primaryButtonText
        self.secondaryButtonText = secondaryButtonText
        self.secondaryAction = secondaryAction
        self.primaryAction = primaryAction
        self.showDismissButton = showDismissButton
    }

    static func == (lhs: CustomAlert, rhs: CustomAlert) -> Bool {
        lhs.title == rhs.title &&
            lhs.message == rhs.message &&
            lhs.primaryButtonText == rhs.primaryButtonText &&
            lhs.secondaryButtonText == rhs.secondaryButtonText
    }
}

extension CustomAlert {
    static func genericWithRetry(_ retry: @escaping () -> Void) -> Self {
        .init(
            title: "Uh Oh",
            message: "Something went wrong, try again",
            primaryButtonText: "Retry",
            primaryAction: retry
        )
    }
}
