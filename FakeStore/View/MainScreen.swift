//
//  MainScreen.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel: ProductViewModel
    @State private var errorMessage: String?
    @State private var isLoading = false
    @StateObject var monitor = NetworkMonitor()

    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    loadingView
                } else if let errorMessage = errorMessage {
                    ErrorView(errorMessage: errorMessage)
                } else {
                    productList
                }
            }
            .navigationBarTitle("Products")
            .onAppear {
                fetchProducts()
            }
        }
    }

    private var loadingView: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
            Text("Loading...")
        }
    }

    private var productList: some View {
        VStack {
            Text(monitor.status.rawValue)
            List(viewModel.products, id: \.id) { product in
                NavigationLink(destination: ProductDetailScreen(product: product)) {
                    ProductCell(product: product)
                }
            }
        }
        
    }

    private func fetchProducts() {
        isLoading = true
        viewModel.fetchProducts { result in
            switch result {
            case .success:
                errorMessage = nil // Reset error message if fetching succeeds
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }

    struct ErrorView: View {
        let errorMessage: String

        var body: some View {
            VStack {
                Image(systemName: "exclamationmark.triangle")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding()
                Text(errorMessage)
                    .font(.title2)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
