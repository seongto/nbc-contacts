//
//  DataFetcher.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/9/24.
//

import UIKit
import Alamofire


struct DataFetcher {
    static func fetchByAlamo<T: Decodable>(url: URL, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request(url).responseDecodable(of: T.self) { response in
            completion(response.result)
        }
    }
}
