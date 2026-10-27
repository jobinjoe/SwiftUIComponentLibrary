//
//  FormInputShowcaseView.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//


import SwiftUI

struct FormInputShowcaseView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var showErrors = false

    private var emailError: String? {
        guard showErrors else { return nil }

        if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Email is required"
        }

        if !email.contains("@") {
            return "Enter a valid email address"
        }

        return nil
    }

    private var passwordError: String? {
        guard showErrors else { return nil }

        return password.count < 8
            ? "Password must contain at least 8 characters"
            : nil
    }

    private var usernameError: String? {
        guard showErrors else { return nil }

        return username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? "Username is required"
            : nil
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Input Variants")
                    .font(.title2)
                    .fontWeight(.bold)

                AppTextField(
                    title: "Email",
                    placeholder: "Enter your email",
                    text: $email,
                    errorMessage: emailError
                )
                .keyboardType(.emailAddress)

                AppTextField(
                    title: "Password",
                    placeholder: "Enter your password",
                    text: $password,
                    errorMessage: passwordError,
                    isSecure: true
                )

                AppTextField(
                    title: "Username",
                    placeholder: "Enter your username",
                    text: $username,
                    errorMessage: usernameError
                )

                AppButton(title: "Validate Form") {
                    showErrors = true
                }

                if showErrors,
                   emailError == nil,
                   passwordError == nil,
                   usernameError == nil {
                    Text("All fields are valid!")
                        .foregroundStyle(.green)
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
        .navigationTitle("Form Input Library")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FormInputShowcaseView()
    }
}

