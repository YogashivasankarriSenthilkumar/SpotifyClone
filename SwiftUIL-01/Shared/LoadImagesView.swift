//
//  LoadImagesView.swift
//  SwiftUIL-01
//
//  Created by Yogashivasankarri Senthilkumar on 28/03/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct LoadImagesView: View {
    var url: String = Constants.imageGenerated
    var resizingMode: ContentMode = .fill

    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay{
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    LoadImagesView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
