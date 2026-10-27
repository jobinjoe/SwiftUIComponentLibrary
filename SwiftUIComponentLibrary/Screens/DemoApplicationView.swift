//
//  DemoApplicationView.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//


import SwiftUI

struct DemoApplicationView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var showErrors = false
    @State private var isConfirmationPresented = false
    @State private var isSubmitted = false

    private var nameError: String? {
        guard showErrors else { return nil }

        return name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? "Name is required"
            : nil
    }

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

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Complete this form to try our reusable components together.")
                        .foregroundStyle(.secondary)
                }

                AppCard(
                    title: "Profile Setup",
                    description: "Enter your details to create a sample profile.",
                    systemImage: "person.crop.circle"
                )

                VStack(alignment: .leading, spacing: 16) {
                    Text("Your Details")
                        .font(.title2)
                        .fontWeight(.bold)

                    AppTextField(
                        title: "Full Name",
                        placeholder: "Enter your name",
                        text: $name,
                        errorMessage: nameError
                    )

                    AppTextField(
                        title: "Email Address",
                        placeholder: "Enter your email",
                        text: $email,
                        errorMessage: emailError
                    )
                    .keyboardType(.emailAddress)

                    AppButton(title: "Submit Details") {
                        showErrors = true

                        if nameError == nil && emailError == nil {
                            isConfirmationPresented = true
                        }
                    }

                    if isSubmitted {
                        Text("Your sample profile was submitted successfully!")
                            .font(.subheadline)
                            .foregroundStyle(.green)
                    }
                }

                AppCard(
                    title: "Component Library",
                    description: "This demo combines reusable buttons, cards, form inputs, and a confirmation sheet.",
                    systemImage: "square.stack.3d.up"
                )
            }
            .padding()
        }
        .navigationTitle("Demo Application")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isConfirmationPresented) {
            AppSheet(
                title: "Confirm Submission",
                message: "Submit the details for \(name)?",
                confirmTitle: "Confirm",
                cancelTitle: "Go Back",
                onConfirm: {
                    isSubmitted = true
                },
                onCancel: {
                    isSubmitted = false
                }
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    NavigationStack {
        DemoApplicationView()
    }
}

