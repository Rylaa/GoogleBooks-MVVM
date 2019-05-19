//
//  SearchBooksViewController.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class SearchBooksViewController : UITableViewController {
    
    //MARK: - Properties
    var viewModel : SearchBooksProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    let searchController = UISearchController(searchResultsController: nil)
    let cellID = "cell"
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "test"
        setupNavBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
    }
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Google Books"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        //tableView.tableHeaderView = searchController.searchBar
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        return cell
    }
    // MARK: - Handlers
}

extension SearchBooksViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let strongText  = searchBar.text else { return }
        self.viewModel?.searchText(with: strongText)
        viewModel?.load()
    }
}

extension SearchBooksViewController : SearchBooksDelegate {
    func handleOutputs(_ outputs: searchBooksOutputs) {
        switch outputs {
        case .pageTitle(let title):
            self.title = title
        case .isLoading(let isLoading):
            print(isLoading)
        //TODO: Implement
        case .bookList(let booksList):
            print(booksList.items[0].volumeInfo.title)
            
            //TODO: Implement
            
        }
    }
    
    
}
