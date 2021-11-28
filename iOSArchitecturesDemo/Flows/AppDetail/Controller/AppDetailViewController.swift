//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp!
    
    private lazy var appDetailHeader = AppDetailHeaderViewController(app: app)
    private lazy var appVersionHistory = AppVersionHistoryViewController(app: app)
    private lazy var screenshotColletion = PreviewViewController(app: app)
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        self.setupAppDetailHeaderViewController()
        self.configureNavigationController()
        self.setupAppVersionHistoryViewController()
        self.setupScreenshotCollectionViewController()
    }
    
    private func setupAppDetailHeaderViewController() {
        self.addChild(self.appDetailHeader)
        
        self.view.addSubview(self.appDetailHeader.view)
        self.appDetailHeader.didMove(toParent: self)
        
        self.appDetailHeader.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.appDetailHeader.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.appDetailHeader.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.appDetailHeader.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
    
    private func setupAppVersionHistoryViewController() {
        self.addChild(self.appVersionHistory)
        
        self.view.addSubview(self.appVersionHistory.view)
        self.appVersionHistory.didMove(toParent: self)
        
        self.appVersionHistory.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.appVersionHistory.view.topAnchor.constraint(equalTo: self.appDetailHeader.view.bottomAnchor, constant: 10),
            self.appVersionHistory.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.appVersionHistory.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
    
    private func setupScreenshotCollectionViewController() {
        self.addChild(self.screenshotColletion)
        
        self.view.addSubview(self.screenshotColletion.view)
        self.screenshotColletion.didMove(toParent: self)
        
        self.screenshotColletion.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.screenshotColletion.view.topAnchor.constraint(equalTo: self.appVersionHistory.view.bottomAnchor, constant: 5),
            self.screenshotColletion.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.screenshotColletion.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }
}
