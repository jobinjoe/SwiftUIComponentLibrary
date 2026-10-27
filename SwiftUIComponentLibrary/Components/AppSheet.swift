//
//  AppSheet.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//


import SwiftUI

enum AppSheetStyle {
    case info
    case confirmation
    case destructive
}

struct AppSheet<Content: View>: View {
    let title: String
    let message: String
    var style: AppSheetStyle = .confirmation
    var confirmTitle: String = "OK"
    var cancelTitle: String? = nil
    let onConfirm: () -> Void
    var onCancel: (() -> Void)? = nil
    private let content: Content

    @Environment(\.dismiss) private var dismiss

    init(
        title: String,
        message: String,
        style: AppSheetStyle = .confirmation,
        confirmTitle: String = "OK",
        cancelTitle: String? = nil,
        @ViewBuilder content: () -> Content,
        onConfirm: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.style = style
        self.confirmTitle = confirmTitle
        self.cancelTitle = cancelTitle
        self.onConfirm = onConfirm
        self.onCancel = onCancel
        self.content = content()
    }

    private var iconName: String {
        switch style {
        case .info:
            return "info.circle.fill"
        case .confirmation:
            return "checkmark.circle.fill"
        case .destructive:
            return "trash.fill"
        }
    }

    private var confirmButtonStyle: AppButtonStyle {
        style == .destructive ? .destructive : .primary
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: iconName)
                .font(.system(size: 40))
                .foregroundStyle(style == .destructive ? .red : .blue)

            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            Text(message)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            content

            VStack(spacing: 12) {
                AppButton(title: confirmTitle, style: confirmButtonStyle) {
                    onConfirm()
                    dismiss()
                }

                if let cancelTitle {
                    AppButton(
                        title: cancelTitle,
                        style: .secondary
                    ) {
                        onCancel?()
                        dismiss()
                    }
                }
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity)
    }
}

extension AppSheet where Content == EmptyView {
    init(
        title: String,
        message: String,
        style: AppSheetStyle = .confirmation,
        confirmTitle: String = "OK",
        cancelTitle: String? = nil,
        onConfirm: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            message: message,
            style: style,
            confirmTitle: confirmTitle,
            cancelTitle: cancelTitle,
            content: { EmptyView() },
            onConfirm: onConfirm,
            onCancel: onCancel
        )
    }
}

extension View {
    func appSheet(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        style: AppSheetStyle = .confirmation,
        confirmTitle: String = "OK",
        cancelTitle: String? = nil,
        onConfirm: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) -> some View {
        sheet(isPresented: isPresented) {
            AppSheet(
                title: title,
                message: message,
                style: style,
                confirmTitle: confirmTitle,
                cancelTitle: cancelTitle,
                onConfirm: onConfirm,
                onCancel: onCancel
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
    }

    func appSheet<Content: View>(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        style: AppSheetStyle = .confirmation,
        confirmTitle: String = "OK",
        cancelTitle: String? = nil,
        onConfirm: @escaping () -> Void,
        onCancel: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        sheet(isPresented: isPresented) {
            AppSheet(
                title: title,
                message: message,
                style: style,
                confirmTitle: confirmTitle,
                cancelTitle: cancelTitle,
                content: content,
                onConfirm: onConfirm,
                onCancel: onCancel
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    AppSheet(
        title: "Confirm Action",
        message: "Are you sure you want to continue?",
        style: .confirmation,
        confirmTitle: "Continue",
        cancelTitle: "Cancel",
        onConfirm: {
            print("Confirmed")
        },
        onCancel: {
            print("Cancelled")
        }
    )
}
