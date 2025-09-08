//
//  CurrentUserProfileView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 07/09/2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var showEditProfileView: Bool = false
    let user: User

    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfileView.toggle()
                    }

                // account info
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullname)
                    }

                    HStack {
                        Text("Email")
                        Spacer()
                        Text("ahmed@gmail.com")
                    }
                }

                // leagal
                Section("Legal") {
                    Text("Terms of service")
                }

                // logout/delet
                Section {
                    Button("Logout") {
                        print("DEBUG: Logout")
                    }
                    .foregroundStyle(.red)
                }

                Section {
                    Button("Delete Account") {
                        print("DEBUG: Delete Account")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfileView) {
                EditProfileView(user: MockData.users[2])
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
