//
//  SongSearchRouterIO.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 26.11.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SongSearchRouterInput {
    
    func openSongDetails(for song: ITunesSong)
}

final class SongSearchRouter: SongSearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openSongDetails(for song: ITunesSong) {

    }

}
