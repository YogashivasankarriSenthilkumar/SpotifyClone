//
//  ContentView.swift
//  SwiftUIL-01
//
//  Created by Yogashivasankarri Senthilkumar on 28/03/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @State private var users: [User] = []
    @State private var products: [Product] = []

    var body: some View {
        ScrollView{
            VStack{
                ForEach(products) { product in
                    Text(product.title)
                }
            }
        }
        .padding()
        .task {
            await getdata()
        }
    }

    private func getdata() async{
        do {
            users = try await Database().getUsers()
            products = try await Database().getProducts()
        }
        catch{

        }
    }
}

#Preview {
    ContentView()
}
