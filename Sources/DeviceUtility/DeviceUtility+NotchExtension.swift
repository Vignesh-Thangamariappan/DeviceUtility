//
//  DeviceUtility+NotchExtension.swift
//  
//
//  Created by Vignesh on 05/02/22.
//

import Foundation

public extension DeviceUtility {
    
    private var notchDevices: [DeviceModel] {
        [
            .iPhoneX,
            .iPhoneXR,
            .iPhoneXS,
            .iPhoneXSMax,
            .iPhone11,
            .iPhone11Pro,
            .iPhone11ProMax,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12ProMax,
            .iPhone12Mini,
            .iPhone13,
            .iPhone13Pro,
            .iPhone13ProMax,
            .iPhone13Mini
        ]
    }
    
    var hasNotch: Bool {
        notchDevices.contains(model)
    }
}
