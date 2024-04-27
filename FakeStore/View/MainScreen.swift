//
//  MainScreen.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel: ProductViewModel
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
        self.viewModel.fetchProducts() // Fetch products when the view is initialized
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.products, id: \.id) { product in
                NavigationLink(destination: ProductDetailScreen(product: product)) {
                    ProductCell(product: product)
                }
            }
            .navigationBarTitle("Products")
        }
    }
}
