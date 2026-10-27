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
    @State private var nameEdited = false
    @State private var emailEdited = false
    @State private var showErrors = false
    @State private var isSubmitting = false
    @State private var isConfirmationPresented = false
    @State private var isSubmitted = false

    init(
        name: String = "",
        email: String = "",
        showErrors: Bool = false,
        isSubmitting: Bool = false,
        isConfirmationPresented: Bool = false,
        isSubmitted: Bool = false
    ) {
        _name = State(initialValue: name)
        _email = State(initialValue: email)
        _showErrors = State(initialValue: showErrors)
        _isSubmitting = State(initialValue: isSubmitting)
        _isConfirmationPresented = State(initialValue: isConfirmationPresented)
        _isSubmitted = State(initialValue: isSubmitted)
    }

    private var nameError: String? {
        guard showErrors || nameEdited else { return nil }

        return name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ? "Name is required"
            : nil
    }

    private var emailError: String? {
        guard showErrors || emailEdited else { return nil }

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
                    .onChange(of: name) {
                        nameEdited = true
                    }

                    AppTextField(
                        title: "Email Address",
                        placeholder: "Enter your email",
                        text: $email,
                        errorMessage: emailError
                    )
                    .keyboardType(.emailAddress)
                    .onChange(of: email) {
                        emailEdited = true
                    }

                    AppButton(
                        title: "Submit Details",
                        systemImage: "paperplane.fill",
                        isLoading: isSubmitting
                    ) {
                        showErrors = true

                        guard nameError == nil, emailError == nil else { return }

                        isSubmitting = true

                        Task {
                            try? await Task.sleep(for: .seconds(1))
                            isSubmitting = false
                            isConfirmationPresented = true
                        }
                    }

                    if isSubmitted {
                        AppCard(
                            title: "Profile submitted",
                            description: "\(name) · \(email)",
                            systemImage: "checkmark.circle.fill",
                            style: .highlighted
                        )
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
        .appSheet(
            isPresented: $isConfirmationPresented,
            title: "Confirm Submission",
            message: "Submit the details for \(name)?",
            style: .confirmation,
            confirmTitle: "Confirm",
            cancelTitle: "Go Back",
            onConfirm: {
                isSubmitted = true
            },
            onCancel: {
                isSubmitted = false
            },
            content: {
                Text(email)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        )
    }
}

#Preview("Ready") {
    NavigationStack {
        DemoApplicationView()
    }
}

#Preview("Validation") {
    NavigationStack {
        DemoApplicationView(
            name: " ",
            email: "jobin",
            showErrors: true
        )
    }
}

#Preview("Loading") {
    NavigationStack {
        DemoApplicationView(
            name: "Jobin P L",
            email: "jobin@example.com",
            isSubmitting: true
        )
    }
}

#Preview("Confirmation") {
    NavigationStack {
        DemoApplicationView(
            name: "Jobin P L",
            email: "jobin@example.com",
            isConfirmationPresented: true
        )
    }
}

#Preview("Submitted") {
    NavigationStack {
        DemoApplicationView(
            name: "Jobin P L",
            email: "jobin@example.com",
            isSubmitted: true
        )
    }
}

