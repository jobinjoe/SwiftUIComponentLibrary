//
//  AppCard.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//

import SwiftUI

enum AppCardStyle {
    case standard
    case outlined
    case highlighted
}

struct AppCard<Content: View>: View {
    let title: String
    let description: String
    var systemImage: String? = nil
    var style: AppCardStyle = .standard
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil
    private let content: Content

    init(
        title: String,
        description: String,
        systemImage: String? = nil,
        style: AppCardStyle = .standard,
        actionTitle: String? = nil,
        @ViewBuilder content: () -> Content,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.description = description
        self.systemImage = systemImage
        self.style = style
        self.actionTitle = actionTitle
        self.action = action
        self.content = content()
    }

    private var backgroundColor: Color {
        switch style {
        case .standard:
            return Color(uiColor: .secondarySystemBackground)
        case .outlined:
            return .clear
        case .highlighted:
            return Color.blue.opacity(0.12)
        }
    }

    private var borderColor: Color {
        switch style {
        case .standard:
            return Color.gray.opacity(0.2)
        case .outlined, .highlighted:
            return .blue
        }
    }

    private var iconColor: Color {
        switch style {
        case .standard:
            return .secondary
        case .outlined, .highlighted:
            return .blue
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let systemImage {
                Image(systemName: systemImage)
                    .font(.system(size: 28))
                    .foregroundStyle(iconColor)
            }

            Text(title)
                .font(.headline)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            content

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
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(borderColor, lineWidth: style == .outlined ? 1.5 : 1)
        }
    }
}

extension AppCard where Content == EmptyView {
    init(
        title: String,
        description: String,
        systemImage: String? = nil,
        style: AppCardStyle = .standard,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            description: description,
            systemImage: systemImage,
            style: style,
            actionTitle: actionTitle,
            content: { EmptyView() },
            action: action
        )
    }
}

#Preview {
    VStack(spacing: 16) {
        AppCard(
            title: "Welcome",
            description: "This is a simple reusable card.",
            systemImage: "hand.wave",
            style: .standard
        )

        AppCard(
            title: "Your Profile",
            description: "View and update your profile details.",
            systemImage: "person.crop.circle",
            style: .highlighted,
            actionTitle: "View Profile"
        ) {
            print("View Profile tapped")
        }
    }
    .padding()
}
