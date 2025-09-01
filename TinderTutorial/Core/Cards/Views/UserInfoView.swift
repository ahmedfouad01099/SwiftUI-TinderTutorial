//
//  UserInfoView.swift
//  TinderTutorial
//
//  Created by Ahmed Fouad on 01/09/2025.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Ahmed")
                    .font(.title)
                    .fontWeight(.heavy)

                Text("26")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()

                Button {
                    print("Debug: Show profile here...")
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
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView()
}
