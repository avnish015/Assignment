//
//  NewsApp.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI

@main
struct NewsApp: App {

    var body: some Scene {
        let viewModel = NewsListViewModelFactory.createViewModel()
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    NewsListView(viewModel: viewModel)
                }
            } else {
                NavigationView {
                    NewsListView(viewModel: viewModel)
                }
                .navigationViewStyle(.stack)
            }
        }
    }
}
