//
//  CardShowcaseView.swift
//  SwiftUIComponentLibrary
//
//  Created by Apple on 23/10/26.
//


import SwiftUI

struct CardShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Card Variants")
                    .font(.title2)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("1. Standard")
                        .font(.headline)

                    AppCard(
                        title: "Welcome",
                        description: "Explore our application and its features.",
                        systemImage: "hand.wave",
                        style: .standard
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("2. Highlighted")
                        .font(.headline)

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

                VStack(alignment: .leading, spacing: 12) {
                    Text("3. Outlined")
                        .font(.headline)

                    AppCard(
                        title: "Notifications",
                        description: "You are all caught up. No new notifications.",
                        style: .outlined
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("4. Custom Content")
                        .font(.headline)

                    AppCard(
                        title: "Storage",
                        description: "You are using 2 GB of 5 GB.",
                        systemImage: "internaldrive",
                        content: {
                            ProgressView(value: 0.4)
                                .tint(.blue)
                        }
                    )
                }
            }
            .padding()
        }
        .navigationTitle("Card Library")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CardShowcaseView()
    }
}

