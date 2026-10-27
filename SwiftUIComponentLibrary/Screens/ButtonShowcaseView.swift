//
//  ButtonShowcaseView.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//

import SwiftUI

struct ButtonShowcaseView: View {
    @State private var isSaving = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Button Variants")
                    .font(.title2)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Primary")
                        .font(.headline)

                    AppButton(title: "Continue", style: .primary) {
                        print("Continue tapped")
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Secondary")
                        .font(.headline)

                    AppButton(title: "Cancel", style: .secondary) {
                        print("Cancel tapped")
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Outlined")
                        .font(.headline)

                    AppButton(title: "Learn More", style: .outlined) {
                        print("Learn More tapped")
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Destructive")
                        .font(.headline)

                    AppButton(title: "Delete", style: .destructive) {
                        print("Delete tapped")
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("With Icon")
                        .font(.headline)

                    AppButton(
                        title: "Save",
                        style: .primary,
                        systemImage: "square.and.arrow.down"
                    ) {
                        print("Save tapped")
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Loading")
                        .font(.headline)

                    AppButton(
                        title: "Save",
                        style: .primary,
                        systemImage: "square.and.arrow.down",
                        isLoading: isSaving
                    ) {
                        isSaving = true

                        Task {
                            try? await Task.sleep(for: .seconds(1))
                            isSaving = false
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Disabled")
                        .font(.headline)

                    AppButton(
                        title: "Unavailable",
                        style: .primary,
                        isDisabled: true
                    ) {
                        print("This should not execute")
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Button Library")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ButtonShowcaseView()
    }
}
