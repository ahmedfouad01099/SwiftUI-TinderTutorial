//
//  UserMatchView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 08/09/2025.
//

import SwiftUI

struct UserMatchView: View {
    @Binding var show: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()

            VStack(spacing: 80) {
                VStack {
                    Image(.itsamatch)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)

                    Text("You and Ahmed have liked each other.")
                        .foregroundStyle(.white)
                }

                HStack(spacing: 16) {
                    Image(MockData.users[0].profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }

                    Image(MockData.users[1].profileImageURLs[1])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                }
                
                VStack(spacing: 16) {
                    Button("Send Message") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 44)
                    .background(Color.pink)
                    .clipShape(Capsule())

                    Button("Keep Swiping") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 44)
                    .background(.clear)
                    .clipShape(Capsule())
                    .overlay {
                        Capsule()
                            .stroke(.white, lineWidth: 2)
                            .shadow(radius: 4)
                    }
                }
            }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
}
