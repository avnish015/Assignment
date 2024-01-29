//
//  ArticleCellView.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import SwiftUI

struct ArticleCellView: View {

    let viewModel: ArticleCellViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(viewModel.author)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(viewModel.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.system(size: 12))
                Text(viewModel.publishedAt)
                    .font(.system(size: 12))
            }
            Spacer()
            AsyncImage(url: viewModel.urlToImage) {image in
                image
                    .resizable()

            } placeholder: {
                Image.placeholder
                    .resizable()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(8)
        }
    }
}

struct ArticleCellView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCellView(viewModel: ArticleCellViewModel(article: Article.sampleArticle))
    }
}
