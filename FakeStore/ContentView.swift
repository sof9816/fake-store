//
//  ContentView.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ProductViewModel()
    
    var body: some View {
        MainScreen(viewModel: viewModel)
    }
}


#Preview {
    ContentView()
}
