//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 25.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

struct SongCellModel {
    let trackName: String
    let artist: String?
    let albumName: String?
    let artwork: String
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(trackName: model.trackName,
                             artist: model.artistName,
                             albumName: model.collectionName,
                             artwork: model.artwork)
    }
}
