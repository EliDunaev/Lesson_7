//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 11/18/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailHeaderViewController: UIViewController {
    
    private var headerView: AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    override func loadView() {
        self.view = AppDetailHeaderView()
    }
    
    private let imageDownloader = ImageDownloader()
    private let app: ITunesApp
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    private func fillData() {
        self.headerView.titleLabel.text = self.app.appName
        self.headerView.subtitleLabel.text = self.app.company
        self.downloadImage()
    }
    
    
    private func downloadImage() {
        guard let url = self.app.iconUrl else { return }
        self.imageDownloader.getImage(fromUrl: url) { (image, error) in
            guard let image = image else { return }
            self.headerView.iconView.image = image
        }
    }
}
