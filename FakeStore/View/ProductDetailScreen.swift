//
//  ProductDetailScreen.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import SwiftUI
import Kingfisher

struct ProductDetailScreen: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                // Product Image
                productImage
                
                // Product Details
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.description)
                        .lineLimit(nil) // Display title in full
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.headline)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", product.rating.rate))
                            .font(.headline)
                        Text("(\(product.rating.count))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }.padding(20)
        }
    }
    
    // Product Image
    private var productImage: some View {
        KFImage(URL(string: product.image))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .clipped()
    }
}

#Preview {
    ContentView()
}
