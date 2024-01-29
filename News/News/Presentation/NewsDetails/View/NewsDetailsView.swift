//
//  NewsDetailsView.swift
//  News
//
//  Created by Avnish Kumar on 03/01/24.
//

import SwiftUI

struct NewsDetailsView: View {

    typealias Copy = DisplayStrings.NewsDetails

    @ObservedObject var viewModel: NewsDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                    .padding()
                AsyncImage(url: viewModel.imageURL) { image in
                    image
                        .resizable()
                        .accessibilityIdentifier(Copy.imageViewIdentifier(url: viewModel.imageURL))
                } placeholder: {
                    Image.placeholder
                        .resizable()
                        .accessibilityIdentifier(Copy.defaultImageIdentifier)
                }
                .frame(height: 300)
                VStack(alignment: .leading, spacing: 12) {
                    Text(Copy.source).fontWeight(.bold) + Text(viewModel.author)
                    Text(Copy.publishedAt).fontWeight(.bold) + Text(viewModel.publishedAt)
                    VStack(alignment: .leading) {
                        Text(Copy.description).fontWeight(.bold)
                        Text(viewModel.description)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .accessibilityElement(children: .combine)
                }
                .padding(.horizontal, 12)
                Spacer()
            }
        }
        .navigationTitle(Copy.newsDetails)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsDetailsView(viewModel: NewsDetailsViewModel(article: Article.sampleArticle))
        }
    }
}
