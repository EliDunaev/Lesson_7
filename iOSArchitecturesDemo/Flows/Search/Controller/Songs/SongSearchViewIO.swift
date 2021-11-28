//
//  SongSearchViewIO.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 24.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchViewInput: AnyObject {
    
    func setSearchResult(_ cellModels: [SongCellModel])
    
    func throbber(show: Bool)
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
}

protocol SongSearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    
    func viewDidSelectSong(_ cellModel: SongCellModel)
}
