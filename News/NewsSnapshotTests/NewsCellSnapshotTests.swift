//
//  NewsSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import News

final class NewsCellSnapshotTests: XCTestCase {

    private var cellView: ArticleCellView!

    override func setUp() {
        let article = Article(id: UUID().uuidString, 
                              author: "David Henderson",
                              title: "An EV Canary in the Coal Mine?",
                              description: "I’ve written before about why I think California is the canary in the coal mine.",
                              url: "https://www.econlib.org/an-ev-canary-in-the-coal-mine/",
                              urlToImage: "https://www.econlib.org/wp-content/uploads/2023/12/Unknown.jpeg",
                              publishedAt: "2023-12-04T18:46:48Z")
        let viewModel = ArticleCellViewModel(article: article)
        cellView = ArticleCellView(viewModel: viewModel)
    }

    func testNewsCellView() {
        assertSnapshot(of: cellView.frame(width: UIScreen.main.bounds.width), as: .image)
    }
}
