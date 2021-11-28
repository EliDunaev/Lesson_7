//
//  SongSearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 26.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
class SongSearchInteractor: SongSearchInteractorInput {
    
    weak var output: SongSearchInteractorOutput?
    
    private let searchService: ITunesSearchService
    
    init(searchService: ITunesSearchService) {
        self.searchService = searchService
    }
    
    func requestSongs(for query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            result
                .withValue { songs in
                    self.output?.receivedSongs(songs)
                }
                .withError {
                    self.output?.receivedError($0)
                }
        }
    }
    
}
