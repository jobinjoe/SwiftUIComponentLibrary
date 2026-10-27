//
//  SheetShowcaseView.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//


import SwiftUI

struct SheetShowcaseView: View {
    @State private var isConfirmationPresented = false
    @State private var isInfoPresented = false
    @State private var resultMessage = "Choose an example below."

    var body: some View {
        VStack(spacing: 20) {
            Text(resultMessage)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            AppButton(title: "Confirmation Sheet") {
                isConfirmationPresented = true
            }

            AppButton(
                title: "Information Sheet",
                style: .secondary
            ) {
                isInfoPresented = true
            }
        }
        .padding()
        .navigationTitle("Sheet Library")
        .navigationBarTitleDisplayMode(.inline)
        .appSheet(
            isPresented: $isConfirmationPresented,
            title: "Delete Item?",
            message: "This action cannot be undone.",
            style: .destructive,
            confirmTitle: "Delete",
            cancelTitle: "Cancel",
            onConfirm: {
                resultMessage = "Delete confirmed."
            },
            onCancel: {
                resultMessage = "Deletion cancelled."
            }
        )
        .appSheet(
            isPresented: $isInfoPresented,
            title: "All Done!",
            message: "Your information has been saved.",
            style: .info,
            confirmTitle: "Got It",
            onConfirm: {
                resultMessage = "Information acknowledged."
            }
        )
    }
}

#Preview {
    NavigationStack {
        SheetShowcaseView()
    }
}

