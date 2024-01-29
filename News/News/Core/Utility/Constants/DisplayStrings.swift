//
//  DisplayString.swift
//  News
//
//  Created by Avnish Kumar on 02/01/24.
//

import Foundation

enum DisplayStrings {
    enum NewsList {
        static let title = "DisplayStrings.NewsList.title".localized
        static let errorTitle = "DisplayStrings.NewsList.errorTitle".localized
        static let retry = "DisplayStrings.NewsList.retry".localized
        static let identifier = "News List"
        static let errorViewIdentifier = "Error View"
        static let customErrorViewIdentifier = "Custom Error View"

        enum NewsCell {
            static let imageView = "Image View"
            static func accessabilityIdentifier(title: String) -> String {
                return "News Cell with title \(title)"
            }
        }
    }

    enum NewsDetails {
        static let source = "DisplayStrings.NewsDetails.source".localized
        static let publishedAt = "DisplayStrings.NewsDetails.published".localized
        static let description = "DisplayStrings.NewsDetails.description".localized
        static let newsDetails = "DisplayStrings.NewsDetails.newsDetails".localized
        static let title = "DisplayStrings.NewsDetails.title".localized
        static let defaultImageIdentifier = "Default Image"
        static func imageViewIdentifier(url: URL?) -> String {
            return "Image with URL \(url?.absoluteString ?? "")"
        }
    }

    enum Other {
        static let sampleFormatted = "DisplayStrings.other.sampleFormatted".localized
        static let unknownSource = "DisplayStrings.other.unknownSource".localized
    }
}
