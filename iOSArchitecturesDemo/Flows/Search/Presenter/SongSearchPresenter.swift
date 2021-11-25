//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 24.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongSearchPresenter: SongSearchViewOutput {
    
    private let searchService: ITunesSearchService
    
    weak var view: (SongSearchViewInput & UIViewController)! //  всегда слабая ссылка!
    
    init(searchService: ITunesSearchService) {
        self.searchService = searchService
    }
    
    // MARK: - SearchViewOutput
    
    func viewDidSearch(with query: String) {
        self.requestSongs(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
//        self.openSongDetails(with: song)
    }
    
    // MARK: - Private
    
    private func requestSongs(with query: String) {
        self.view.throbber(show: true)
        self.view.searchResults = []
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.view.searchResults = []
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.searchResults = songs
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
    
//    private func openSongDetails(with app: ITunesSong) {
//        let appDetaillViewController = AppDetailViewController()
//        appDetaillViewController.song = song
//        self.view.navigationController?.pushViewController(appDetaillViewController, animated: true)
//    }
}

