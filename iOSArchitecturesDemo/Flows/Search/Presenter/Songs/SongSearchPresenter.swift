//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 24.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

final class SongSearchPresenter {
    
    var interactor: SongSearchInteractor!
    var router: SongSearchRouterInput!
    weak var view: SongSearchViewInput!
    
    var songs: [ITunesSong] = []
    
}

// MARK: - SearchViewOutput
extension SongSearchPresenter: SongSearchViewOutput {
    
    func viewDidSelectSong(_ cellModel: SongCellModel) {
    }
    
    
    func viewDidSearch(with query: String) {
        self.view.throbber(show: true)
        self.interactor.requestSongs(for: query)
    }
}

extension SongSearchPresenter: SongSearchInteractorOutput {
    
    func receivedError(_ error: Error) {
        self.view.throbber(show: false)
        self.view.showNoResults()
    }
    
    func receivedSongs(_ songs: [ITunesSong]) {
        self.view.throbber(show: false)
        
        self.songs = songs
        
        if songs.isEmpty {
            self.view.showNoResults()
        } else {
            self.view.hideNoResults()
        }
        
        let models = songs.map { SongCellModelFactory.cellModel(from: $0) }
        self.view.setSearchResult(models)
    }
}
