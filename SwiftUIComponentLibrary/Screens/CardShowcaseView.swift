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
                    Text("1. Basic Card")
                        .font(.headline)

                    AppCard(
                        title: "Welcome",
                        description: "Explore our application and its features.",
                        systemImage: "hand.wave"
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("2. Card with Action")
                        .font(.headline)

                    AppCard(
                        title: "Your Profile",
                        description: "View and update your profile details.",
                        systemImage: "person.crop.circle",
                        actionTitle: "View Profile"
                    ) {
                        print("View Profile tapped")
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("3. Text-Only Card")
                        .font(.headline)

                    AppCard(
                        title: "Notifications",
                        description: "You are all caught up. No new notifications."
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

