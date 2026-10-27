//
//  AppTextField.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//


import SwiftUI

struct AppTextField: View {
    let title: String
    let placeholder: String

    @Binding var text: String

    var errorMessage: String? = nil
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)

            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .textInputAutocapitalization(.never)
            .padding(12)
            .background(Color(uiColor: .secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        errorMessage == nil
                            ? Color.gray.opacity(0.3)
                            : Color.red,
                        lineWidth: 1
                    )
            }

            if let errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    @Previewable @State var email = ""
    @Previewable @State var password = ""

    VStack(spacing: 20) {
        AppTextField(
            title: "Email",
            placeholder: "Enter your email",
            text: $email
        )

        AppTextField(
            title: "Password",
            placeholder: "Enter your password",
            text: $password,
            isSecure: true
        )

        AppTextField(
            title: "Username",
            placeholder: "Enter your username",
            text: .constant(""),
            errorMessage: "Username is required"
        )
    }
    .padding()
}

