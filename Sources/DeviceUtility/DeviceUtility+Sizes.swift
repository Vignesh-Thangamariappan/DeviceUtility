//
//  File.swift
//  
//
//  Created by Vignesh on 29/07/22.
//

import Foundation
import UIKit

public extension DeviceUtility {
    
    private var tabBarHeight: CGFloat { 68 }
    var tabBarSize: CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: self.hasNotch ? tabBarHeight + 30 : tabBarHeight)
    }
}
