//
//  NativeExtensions.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 29/11/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import AppKit
import SwiftUI

extension NSTableView {
  open override func viewDidMoveToWindow() {
    super.viewDidMoveToWindow()

    backgroundColor = NSColor.clear
    enclosingScrollView!.drawsBackground = false
  }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
