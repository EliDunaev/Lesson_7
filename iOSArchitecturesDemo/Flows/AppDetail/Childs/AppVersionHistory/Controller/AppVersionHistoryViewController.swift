//
//  AppVersionHistoryViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Илья Дунаев on 19.11.2021.
//  Copyright © 2021 Илья Дунаев. All rights reserved.
//

import UIKit

class AppVersionHistoryViewController: UIViewController {
    
    private var versionView: AppVersionHistoryView {
        return self.view as! AppVersionHistoryView
    }
    
    override func loadView() {
        self.view = AppVersionHistoryView()
    }
    
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
        self.versionView.titleLabel.text = "Что нового"
        self.versionView.versionLabel.text = "Version \(self.app.version)"
        self.versionView.dateLabel.text = self.app.currentVersionReleaseDate
        self.versionView.descriptionLabel.text = self.app.releaseNotes
    }
}
