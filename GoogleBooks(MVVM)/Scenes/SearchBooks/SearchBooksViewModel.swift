//
//  SearchBooksViewModel.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

final class SearchBooksViewModel : SearchBooksProtocol {
    
    
    
    // MARK: - Properties
    var searchText : String?
    // MARK: - Init
    
    // MARK: - Handlers
    weak var delegate: SearchBooksDelegate?
    
    func load() {
        notify(.isLoading(true))
        BooksService.fetchBooksList(with: searchText!) { [weak self] (response) in
            guard let self = self else {return}
            self.notify(.isLoading(false))
            self.notify(.pageTitle("Books"))
            switch response {
            case .success(let succes):
                self.notify(.bookList(succes))
            case .failure(let error):
                AlertService.alert(error: String(describing: error))
            }
        }
    }
    func notify(_ output:searchBooksOutputs) {
        delegate?.handleOutputs(output)
    }
    func searchText(with SearchText: String) {
        self.searchText = SearchText
    }
}
