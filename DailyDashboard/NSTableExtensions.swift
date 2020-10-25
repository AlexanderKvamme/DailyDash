//
//  NSTableExtensions.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 25/10/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation
import AppKit

// MARK: - Make tableview background clear

extension NSTableView {
    open override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()

        // set the background color of every list
        backgroundColor = .clear
        enclosingScrollView?.drawsBackground = false
        enclosingScrollView?.backgroundColor = .clear
        enclosingScrollView?.autohidesScrollers = true
        enclosingScrollView?.verticalScroller = MyScroller()
    }
}

class MyScroller: NSScroller {
    override func draw(_ dirtyRect: NSRect) {
        self.drawKnob()
    }
}
