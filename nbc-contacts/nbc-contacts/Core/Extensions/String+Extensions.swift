//
//  String+Extensions.swift
//  nbc-contacts
//
//  Created by MaxBook on 12/11/24.
//

import UIKit
import Alamofire


extension String {
    func loadAsyncImage(_ completion: @escaping (UIImage?) -> ()) {
        guard let url: URL = URL(string: self) else { return }
        
        DataFetcher.fetchImageByAlamo(url: url) { (result: Result<Data, AFError>) in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    completion(UIImage(data: result))
                }
            case .failure(let error):
                print("이미지 가져오기 실패 : \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
