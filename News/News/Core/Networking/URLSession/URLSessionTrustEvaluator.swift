//
//  URLSessionTrustEvaluator.swift
//  News
//
//  Created by Avnish Kumar on 29/01/24.
//

import Foundation
import TrustKit

class URLSessionTrustEvaluator: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession,
                    didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if TrustKit.sharedInstance().pinningValidator.handle(challenge, completionHandler: completionHandler) == false {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
