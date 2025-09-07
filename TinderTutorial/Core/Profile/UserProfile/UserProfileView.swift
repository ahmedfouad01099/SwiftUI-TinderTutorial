//
//  UserProfileView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 05/09/2025.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentImageIndex = 0

    let user: User

    var body: some View {
        VStack {
            HStack {
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("\(user.age)")
                    .font(.title2)

                Spacer()

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink)

                }

            }
            .padding(.horizontal)

            ScrollView {
                VStack {
                    ZStack(alignment: .top) {
                        Image(user.profileImageURLs[currentImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: SizeConstants.cardWidth,
                                height: SizeConstants.cardHeight
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                ImageScrollingOverlay(
                                    currentImageIndex: $currentImageIndex,
                                    imageCount: user.profileImageURLs.count
                                )
                            }
                        CardImageIndicatorView(
                            currentImageIndex: currentImageIndex,
                            imageCount: user.profileImageURLs.count
                        )
                    }
                    
                    VStack {
                        Text("About me")
                            .fontWeight(.semibold)

                        Text("Some test bio for me...")

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .font(.subheadline)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                VStack(alignment: .leading) {
                    Text("Essentials")
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "person")
                        Text("Man")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                        Text("Straight")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "book")
                        Text("Actress")
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .font(.subheadline)
            }
        }
    }
}

#Preview {
    UserProfileView(user: MockData.users[0])
}
