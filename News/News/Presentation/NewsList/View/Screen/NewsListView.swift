//
//  NewsListView.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI

struct NewsListView: View {

    typealias Copy = DisplayStrings.NewsList

    @ObservedObject var viewModel: NewsListViewModel

    init(viewModel: NewsListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            switch viewModel.newsState {
            case .loading:
                ProgressView()
            case .loaded:
                newsListView()
            case .failed(let description):
               failedErrorView(description: description)
            }
        }
        .onAppear {
            if viewModel.isEmpty {
                viewModel.refreshArticleList(showLoading: true)
            }
        }
    }

    private func newsListView() -> some View {
        List {
            ForEach(viewModel.articleList) { article in
                NavigationLink {
                    NewsListRouter.destinationForTappedArticle(article: article)
                } label: {
                    ArticleCellView(viewModel: viewModel.createArticleCellViewModel(for: article))
                        .accessibilityElement(children: .ignore)
                        .accessibilityHint(article.accessabilityHint)
                        .accessibilityIdentifier(Copy.NewsCell.accessabilityIdentifier(title: article.title))
                }
            }
        }
        .refreshable {
            viewModel.refreshArticleList(showLoading: false)
        }
        .accessibilityIdentifier(Copy.identifier)
        .listStyle(.plain)
        .listRowSeparator(.visible, edges: .all)
        .navigationTitle(Copy.title)
        .padding(.all, 0)
    }

    private func failedErrorView(description: String) -> some View {
        VStack {
            if #available(iOS 17.0, *) {
                ContentUnavailableView {
                    Image.unavailable.foregroundColor(.yellow)
                } description: {
                    Text(description)
                } actions: {
                    Button(Copy.retry) {
                        viewModel.refreshArticleList(showLoading: false)
                    }
                }
                .accessibilityIdentifier(Copy.errorViewIdentifier)
            } else {
                NetworkErrorView(description: description) {
                    viewModel.refreshArticleList(showLoading: true)
                }
                .accessibilityIdentifier(Copy.errorViewIdentifier)
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsListView(viewModel: NewsListViewModelFactory.createViewModel())
        }
    }
}
