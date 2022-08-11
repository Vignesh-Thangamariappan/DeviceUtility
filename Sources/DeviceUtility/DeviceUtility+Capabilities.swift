//
//  File 2.swift
//  
//
//  Created by Vignesh on 11/08/22.
//

import Foundation

extension DeviceUtility {
    /// All devices that feature a screen with rounded corners.
    var allDevicesWithRoundedDisplayCorners: [DeviceModel] {
        return [.iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPadAir4, .iPadAir5, .iPadMini6, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// Returns whether or not the device has a screen with rounded corners.
    var hasRoundedDisplayCorners: Bool {
        return isOneOf(allDevicesWithRoundedDisplayCorners)
    }
    
    /// All devices that have 3D Touch support.
    var allDevicesWith3dTouchSupport: [DeviceModel] {
        return [.iPhone6S, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax]
    }
    
    /// Returns whether or not the device has 3D Touch support.
    var has3dTouchSupport: Bool {
        return isOneOf(allDevicesWith3dTouchSupport)
    }
    
    /// All devices that support wireless charging.
    var allDevicesWithWirelessChargingSupport: [DeviceModel] {
        return [.iPhone8, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhoneSE2, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPhoneSE3]
    }
    
    /// Returns whether or not the device supports wireless charging.
    var supportsWirelessCharging: Bool {
        return isOneOf(allDevicesWithWirelessChargingSupport)
    }
    
    /// All devices that have a LiDAR sensor.
    var allDevicesWithALidarSensor: [DeviceModel] {
        return [.iPhone12Pro, .iPhone12ProMax, .iPhone13Pro, .iPhone13ProMax, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// Returns whether or not the device has a LiDAR sensor.
    var hasLidarSensor: Bool {
        return isOneOf(allDevicesWithALidarSensor)
    }
}

