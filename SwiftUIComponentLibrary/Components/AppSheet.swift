//
//  AppSheet.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//


import SwiftUI

struct AppSheet: View {
    let title: String
    let message: String
    var confirmTitle: String = "OK"
    var cancelTitle: String? = nil
    let onConfirm: () -> Void
    var onCancel: (() -> Void)? = nil

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "rectangle.portrait.bottomhalf.filled")
                .font(.system(size: 40))
                .foregroundStyle(.blue)

            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            Text(message)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            VStack(spacing: 12) {
                AppButton(title: confirmTitle) {
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

#Preview {
    AppSheet(
        title: "Confirm Action",
        message: "Are you sure you want to continue?",
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

