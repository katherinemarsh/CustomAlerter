//
//  AlertingModal.swift
//  CustomAlerter
//
//  Created by Kat Marsh on 2/13/24.
//

import SwiftUI

enum PresentationStyle {
    case sheet
    case fullScreenCover
}

extension View {
    /// Presents a modal when a binding to a Boolean value that you provide is true.
    ///
    /// The content provided will be wrapped in an ``AlertPresenter``, allowing custom alerts
    /// to be displayed on top of the modal.
    ///
    /// - Parameters:
    ///   - presentationStyle: The style of presentation for the modal.
    ///   - isPresented: A binding to a Boolean value that determines whether to present the modal that you create in the modifier’s content closure.
    ///   - onDismiss: The closure to execute when dismissing the modal.
    ///   - content: A closure that returns the content of the modal.
    @ViewBuilder
    func modal<Content: View>(
        _ presentation: PresentationStyle = .sheet,
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        switch presentation {
        case .sheet:
            self
                .sheet(isPresented: isPresented, onDismiss: onDismiss) {
                    AlertPresenter(content)
                }
        case .fullScreenCover:
            self
                .fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
                    AlertPresenter(content)
                }
        }
    }

    /// Presents a modal using the given item as a data source for the modal's content.
    ///
    /// The content provided will be wrapped in an ``AlertPresenter``, allowing custom alerts
    /// to be displayed on top of the modal.
    ///
    /// - Parameters:
    ///   - presentationStyle: The style of presentation for the modal.
    ///   - item: A binding to an optional source of truth for the modal. When item is non-nil, the system passes the item’s content to the modifier’s closure.You display this content in a modal that you create that the system displays to the user. If item changes, the system dismisses the sheet and replaces it with a new one using the same process.
    ///   - onDismiss: The closure to execute when dismissing the modal.
    ///   - content:  A closure that returns the content of the modal.
    @ViewBuilder
    func modal<Content: View, Item: Identifiable>(
        _ presentation: PresentationStyle = .sheet,
        item: Binding<Item?>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View {
        switch presentation {
        case .sheet:
            self
                .sheet(item: item, onDismiss: onDismiss) { item in
                    AlertPresenter {
                        content(item)
                    }
                }
        case .fullScreenCover:
            self
                .fullScreenCover(item: item, onDismiss: onDismiss) { item in
                    AlertPresenter {
                        content(item)
                    }
                }
        }
    }
}
