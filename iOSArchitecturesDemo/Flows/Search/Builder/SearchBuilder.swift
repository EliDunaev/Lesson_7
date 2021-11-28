//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 11/18/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

// этот объект собирает мне модуль MVP для поиска

class SearchBuilder {
    static func buildAppSearch() -> SearchViewController {
        let view = SearchViewController()
        
        let presenter = SearchPresenter(searchService: ITunesSearchService())
        
        view.output = presenter
        presenter.view = view
        
        return view
    }
    
    static func buildSongSearch() -> SongSearchViewController {
        let viewController = SongSearchViewController()
        let presenter = SongSearchPresenter()
        let interactor = SongSearchInteractor(searchService: ITunesSearchService())
        let router = SongSearchRouter()
        
        router.viewController = viewController
        
        viewController.output = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        
        interactor.output = presenter
        return viewController
    }
}
