//
//  CurrentUserProfileView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 07/09/2025.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileHeaderView(user: user)

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
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
