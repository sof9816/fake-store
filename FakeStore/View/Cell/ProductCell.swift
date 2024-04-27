//
//  ProductCell.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//
import SwiftUI
import Kingfisher

struct ProductCell: View {
    let product: Product
    private let imageWidth: CGFloat = UIScreen.main.bounds.height * 0.1
    private let imageHeight: CGFloat = UIScreen.main.bounds.height * 0.15
    
    var body: some View {
        HStack(spacing: 20) {
            // Image
            productImage
            
            // Product Details
            VStack(alignment: .leading, spacing: 8) {
                productName
                productPrice
                productRating
            }
            .padding(.vertical, 10)
        }
        .frame(height: imageHeight)
    }
    
    // MARK: - Views
    
    private var productImage: some View {
        KFImage(URL(string: product.image))
            .placeholder {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .cornerRadius(10)
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageWidth, height: imageHeight)
            .clipped()
            .cornerRadius(10)
    }
    
    private var productName: some View {
        Text(product.title)
            .font(.system(size: 20, weight: .bold))
            .lineLimit(2)
    }
    
    private var productPrice: some View {
        Text("$\(String(format: "%.2f", product.price))")
    }
    
    private var productRating: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(String(format: "%.1f", product.rating.rate))
                .font(.system(size: 16, weight: .bold))
            Text("(\(product.rating.count))")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
        }
    }
}
