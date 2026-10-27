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
        .sheet(isPresented: $isConfirmationPresented) {
            AppSheet(
                title: "Delete Item?",
                message: "This action cannot be undone.",
                confirmTitle: "Delete",
                cancelTitle: "Cancel",
                onConfirm: {
                    resultMessage = "Delete confirmed."
                },
                onCancel: {
                    resultMessage = "Deletion cancelled."
                }
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $isInfoPresented) {
            AppSheet(
                title: "All Done!",
                message: "Your information has been saved.",
                confirmTitle: "Got It",
                onConfirm: {
                    resultMessage = "Information acknowledged."
                }
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    NavigationStack {
        SheetShowcaseView()
    }
}

