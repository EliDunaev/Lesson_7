//
//  SongViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 25.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongSearchViewController: UIViewController, SongSearchViewInput, UIToolbarDelegate {
    
    
    // MARK: - Private Properties
    
    private var searchView: SongSearchView {
        return self.view as! SongSearchView
    }
    
    var searchResults = [ITunesSong]() {
        didSet {
            self.searchView.searchBar.resignFirstResponder()
            self.searchView.tableView.isHidden = self.searchResults.isEmpty
            self.searchView.tableView.reloadData()
        }
    }
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    var output: SongSearchViewOutput! // Всегда сильная ссылка
    private let imageDownloader = ImageDownloader()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SongSearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.searchView.searchBar.delegate = self
        self.searchView.tableView.register(SongCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
        self.searchView.toolBar.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
    
    // MARK: - SearchViewInput
    
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.searchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.searchView.emptyResultView.isHidden = true
    }
    
}

//MARK: - UITableViewDataSource
extension SongSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? SongCell else {
            return dequeuedCell
        }
        let song = self.searchResults[indexPath.row]
        let cellModel = SongCellModelFactory.cellModel(from: song)
        cell.configure(with: cellModel)
        
        self.imageDownloader.getImage(fromUrl: song.artwork) { (image, error) in
            guard let image = image else { return }
            cell.songCover.image = image
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SongSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let song = searchResults[indexPath.row]
        self.output.viewDidSelectSong(song)
    }
}

//MARK: - UISearchBarDelegate
extension SongSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        
        self.output.viewDidSearch(with: query)
    }
}

