//
//  SpotifyHomeScreen.swift
//  SwiftUIL-01
//
//  Created by Yogashivasankarri Senthilkumar on 28/03/24.
//

import SwiftUI

struct SpotifyHomeScreen: View {
    @State private var currentUser: User? = nil
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            HStack{
                if let currentUser{
                    LoadImagesView(url: currentUser.image)
                        .frame(width: 30, height: 30)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {}
                }
                ScrollView(.horizontal){
                    HStack(spacing: 8){
                        ForEach(0..<20){ _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 10,height: 10)
                        }
                    }
                }.scrollIndicators(.hidden)
            }
        }.task {
            await getdata()
        }
    }

    private func getdata() async{
        do {
            currentUser = try await Database().getUsers().first
        }
        catch{

        }
    }
}

#Preview {
    SpotifyHomeScreen()
}
