//
//  NewsListViewSnapshotTests.swift
//  NewsSnapshotTests
//
//  Created by Avnish Kumar on 04/01/24.
//

import XCTest
import SnapshotTesting
@testable import News

final class NewsListViewSnapshotTests: XCTestCase {

    private var view: NewsListView!

    override func setUp() {
        let mockRepository = ArticleListDataRepositoryMock(shouldFail: false)
        let usecase = ArticleListUseCase(repository: mockRepository)
        let viewModel = NewsListViewModel(useCase: usecase)
        view = NewsListView(viewModel: viewModel)
        view.viewModel.refreshArticleList(showLoading: true)
    }

    func testNewsListView() throws {

        assertSnapshot(of: view.frame(width: UIScreen.main.bounds.width,
                                      height: UIScreen.main.bounds.height),
                                      as: .image)
    }
}
