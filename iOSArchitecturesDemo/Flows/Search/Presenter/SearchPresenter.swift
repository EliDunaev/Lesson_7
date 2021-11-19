//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 11/18/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchPresenter: SearchViewOutput {
    
    private let searchService: ITunesSearchService
    
    weak var view: (SearchViewInput & UIViewController)! //  всегда слабая ссылка!
    
    init(searchService: ITunesSearchService) {
        self.searchService = searchService
    }
    
    // MARK: - SearchViewOutput
    
    func viewDidSearch(with query: String) {
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.openAppDetails(with: app)
    }
    
    // MARK: - Private
    
    private func requestApps(with query: String) {
        self.view.throbber(show: true)
        self.view.searchResults = []
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.view.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.view.searchResults = []
                        self.view.showNoResults()
                        return
                    }
                    self.view.hideNoResults()
                    self.view.searchResults = apps
                }
                .withError {
                    self.view.showError(error: $0)
                }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController()
        appDetaillViewController.app = app
        self.view.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
}
