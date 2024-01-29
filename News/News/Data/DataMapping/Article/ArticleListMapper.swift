//
//  ArticleListMapper.swift
//  News
//
//  Created by Avnish Kumar on 17/01/24.
//

import Foundation

enum ArticleListMapper: Mappable {

    typealias Input = [ArticleDataModel]
    typealias Output = [ArticleDomainModel]

    static func toModel(_ input: Input) -> Output {
        return input.map { ArticleMapper.toModel($0) }
    }
}
