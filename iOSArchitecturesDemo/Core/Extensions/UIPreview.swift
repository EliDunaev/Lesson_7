//
//  UIPreview.swift
//  iOSArchitecturesDemo
//
//  Created by v.prusakov on 11/18/21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import SwiftUI

struct UIPreview<V: UIView>: UIViewRepresentable {
    
    private let view: V
    
    init(_ view: V) {
        self.view = view
    }
    
    func makeUIView(context: Context) -> V {
        self.view
    }
    
    func updateUIView(_ uiView: V, context: Context) {
    
    }
}
