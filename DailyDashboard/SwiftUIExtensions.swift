//
//  File.swift
//  DailyDashboard
//
//  Created by Alexander Kvamme on 28/12/2020.
//  Copyright © 2020 Alexander Kvamme. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
    
    @ViewBuilder func isVisible(_ shown: Bool) -> some View {
        self.isHidden(!shown)
    }
}
