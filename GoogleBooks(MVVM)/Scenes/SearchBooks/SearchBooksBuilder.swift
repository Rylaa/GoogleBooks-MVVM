//
//  SearchBooksBuilder.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

final class SearchBooksBuilder {
    static func make()->SearchBooksViewController {
        let controller = SearchBooksViewController()
        controller.viewModel = SearchBooksViewModel()
        return controller
    }
}
