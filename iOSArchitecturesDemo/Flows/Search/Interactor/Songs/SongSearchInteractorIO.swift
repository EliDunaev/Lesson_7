//
//  SongSearchInteractorIO.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 28.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol SongSearchInteractorInput: AnyObject {
    func requestSongs(for query: String)
}

protocol SongSearchInteractorOutput: AnyObject {
    func receivedSongs(_ apps: [ITunesSong])
    func receivedError(_ error: Error)
}
