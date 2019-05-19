//
//  BooksService.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Alamofire
import UIKit
// Searchbarda veri girilip ara denildiği anda
// JSON u doldurmamız gerekcek
final class BooksService {
    static func fetchBooksList(with parameter: String, completion: @escaping(APIResult<BookList>) -> Void)  {
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(parameter.lowercased())"
        print(urlString)
        AF.request(urlString).responseData { (DataResponse) in
            switch DataResponse.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let Result = try decoder.decode(BookList.self, from: data)
                    completion(.success(Result))
                } catch let error{
                    AlertService.alert(error: String(describing: error))
                }
            case .failure(let failure):
                AlertService.alert(error: String(describing: failure))
            }
        }
    }
}
