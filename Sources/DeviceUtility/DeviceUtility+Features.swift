//
//  File.swift
//  
//
//  Created by Vignesh on 11/08/22.
//

import UIKit

extension DeviceUtility {
    
    var isZoomed: Bool? {
        //        guard isCurrent else { return nil }
        if Int(UIScreen.main.scale.rounded()) == 3 {
            // Plus-sized
            return UIScreen.main.nativeScale > 2.7 && UIScreen.main.nativeScale < 3
        } else {
            return UIScreen.main.nativeScale > UIScreen.main.scale
        }
    }
    
    /// All Touch ID Capable Devices
    var allTouchIDCapableDevices: [DeviceModel] {
        return [.iPhone5S, .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneSE2, .iPhoneSE3, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPad7, .iPad8, .iPad9, .iPadAir4, .iPadAir5, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch]
    }
    
    /// All Face ID Capable Devices
    var allFaceIDCapableDevices: [DeviceModel] {
        return [.iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// All Devices with Touch ID or Face ID
    var allBiometricAuthenticationCapableDevices: [DeviceModel] {
        return [.iPhone5S, .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhoneSE2, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPhoneSE3, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPad7, .iPad8, .iPad9, .iPadAir4, .iPadAir5, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// Returns whether or not the device has Touch ID
    public var isTouchIDCapable: Bool {
        return isOneOf(allTouchIDCapableDevices)
    }
    
    /// Returns whether or not the device has Face ID
    var isFaceIDCapable: Bool {
        return isOneOf(allFaceIDCapableDevices)
    }
    
    /// Returns whether or not the device has any biometric sensor (i.e. Touch ID or Face ID)
    var hasBiometricSensor: Bool {
        return isTouchIDCapable || isFaceIDCapable
    }
    
    /// All devices that feature a sensor housing in the screen
    var allDevicesWithSensorHousing: [DeviceModel] {
        return [.iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax]
    }
    
    //    /// All simulator devices that feature a sensor housing in the screen
    //    static var allSimulatorDevicesWithSensorHousing: [DeviceModel] {
    //        return allDevicesWithSensorHousing.map(DeviceModel.simulator)
    //    }
    
    /// Returns whether or not the device has a sensor housing
    var hasSensorHousing: Bool {
        return isOneOf(allDevicesWithSensorHousing)
    }
}

extension DeviceModel {
    /// True when a Guided Access session is currently active; otherwise, false.
    var isGuidedAccessSessionActive: Bool {
#if os(iOS)
#if swift(>=4.2)
        return UIAccessibility.isGuidedAccessEnabled
#else
        return UIAccessibilityIsGuidedAccessEnabled()
#endif
#else
        return false
#endif
    }
    
    /// The brightness level of the screen.
    var screenBrightness: Int {
#if os(iOS)
        return Int(UIScreen.main.brightness * 100)
#else
        return 100
#endif
    }
}
