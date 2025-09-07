//
//  UserInfoView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 01/09/2025.
//

import SwiftUI

struct UserInfoView: View {
    let user: User
    @Binding var showUserProfile: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullname)
                    .font(.title)
                    .fontWeight(.heavy)

                Text("\(user.age )")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()

                Button {
                    showUserProfile.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)

                }
            }

            Text("Software Engineer")
                .font(.subheadline)
                .lineLimit(2)
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            LinearGradient(
                colors: [.clear, .black],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    UserInfoView(user: MockData.users[0], showUserProfile: .constant(false))
}
