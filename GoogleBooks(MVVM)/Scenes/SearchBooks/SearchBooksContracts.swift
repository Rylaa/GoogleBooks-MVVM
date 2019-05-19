//
//  SearchBooksContracts.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

protocol SearchBooksProtocol {
    var delegate : SearchBooksDelegate? {get set}
    func searchText(with SearchText: String)
    func load()
}
enum searchBooksOutputs {
    case pageTitle(String)
    case isLoading(Bool)
    case bookList(BookList)
}
protocol SearchBooksDelegate : class {
    func handleOutputs(_ outputs: searchBooksOutputs)
}
