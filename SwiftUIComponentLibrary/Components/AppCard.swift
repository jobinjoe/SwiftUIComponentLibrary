//
//  AppCard.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//

import SwiftUI

struct AppCard: View {
    let title: String
    let description: String
    var systemImage: String? = nil
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let systemImage {
                Image(systemName: systemImage)
                    .font(.system(size: 28))
                    .foregroundStyle(.blue)
            }

            Text(title)
                .font(.headline)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            if let actionTitle, let action {
                AppButton(
                    title: actionTitle,
                    style: .primary,
                    action: action
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(uiColor: .secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        AppCard(
            title: "Welcome",
            description: "This is a simple reusable card.",
            systemImage: "hand.wave"
        )

        AppCard(
            title: "Your Profile",
            description: "View and update your profile details.",
            systemImage: "person.crop.circle",
            actionTitle: "View Profile"
        ) {
            print("View Profile tapped")
        }
    }
    .padding()
}
