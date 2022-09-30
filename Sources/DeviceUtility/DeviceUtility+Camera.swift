//
//  File.swift
//  
//
//  Created by Vignesh on 11/08/22.
//

import Foundation

#if os(iOS)
// MARK: Cameras
extension DeviceUtility {
    
    public enum CameraType {
        @available(*, deprecated, renamed: "wide")
        case normal
        
        case wide
        case telephoto
        case ultraWide
    }
    
    /// Returns an array of the types of cameras the device has
    public var cameras: [CameraType] {
        switch model {
        case .iPodTouch5: return [.wide]
        case .iPodTouch6: return [.wide]
        case .iPodTouch7: return [.wide]
        case .iPhone4: return [.wide]
        case .iPhone4S: return [.wide]
        case .iPhone5: return [.wide]
        case .iPhone5C: return [.wide]
        case .iPhone5S: return [.wide]
        case .iPhone6: return [.wide]
        case .iPhone6Plus: return [.wide]
        case .iPhone6S: return [.wide]
        case .iPhone6SPlus: return [.wide]
        case .iPhone7: return [.wide]
        case .iPhoneSE: return [.wide]
        case .iPhone8: return [.wide]
        case .iPhoneXR: return [.wide]
        case .iPhoneSE2: return [.wide]
        case .iPhoneSE3: return [.wide]
        case .iPad2: return [.wide]
        case .iPad3: return [.wide]
        case .iPad4: return [.wide]
        case .iPadAir: return [.wide]
        case .iPadAir2: return [.wide]
        case .iPad5: return [.wide]
        case .iPad6: return [.wide]
        case .iPadAir3: return [.wide]
        case .iPad7: return [.wide]
        case .iPad8: return [.wide]
        case .iPad9: return [.wide]
        case .iPadAir4: return [.wide]
        case .iPadAir5: return [.wide]
        case .iPadMini: return [.wide]
        case .iPadMini2: return [.wide]
        case .iPadMini3: return [.wide]
        case .iPadMini4: return [.wide]
        case .iPadMini5: return [.wide]
        case .iPadMini6: return [.wide]
        case .iPadPro9Inch: return [.wide]
        case .iPadPro12Inch: return [.wide]
        case .iPadPro12Inch2: return [.wide]
        case .iPadPro10Inch: return [.wide]
        case .iPadPro11Inch: return [.wide]
        case .iPadPro12Inch3: return [.wide]
        case .iPhone7Plus: return [.wide, .telephoto]
        case .iPhone8Plus: return [.wide, .telephoto]
        case .iPhoneX: return [.wide, .telephoto]
        case .iPhoneXS: return [.wide, .telephoto]
        case .iPhoneXSMax: return [.wide, .telephoto]
        case .iPhone11: return [.wide, .ultraWide]
        case .iPhone12: return [.wide, .ultraWide]
        case .iPhone12Mini: return [.wide, .ultraWide]
        case .iPhone13: return [.wide, .ultraWide]
        case .iPhone13Mini: return [.wide, .ultraWide]
        case .iPhone14: return [.wide, .ultraWide]
        case .iPadPro11Inch2: return [.wide, .ultraWide]
        case .iPadPro12Inch4: return [.wide, .ultraWide]
        case .iPadPro11Inch3: return [.wide, .ultraWide]
        case .iPadPro12Inch5: return [.wide, .ultraWide]
        case .iPhone11Pro: return [.wide, .telephoto, .ultraWide]
        case .iPhone11ProMax: return [.wide, .telephoto, .ultraWide]
        case .iPhone12Pro: return [.wide, .telephoto, .ultraWide]
        case .iPhone12ProMax: return [.wide, .telephoto, .ultraWide]
        case .iPhone13Pro: return [.wide, .telephoto, .ultraWide]
        case .iPhone13ProMax: return [.wide, .telephoto, .ultraWide]
        case .iPhone14Pro,.iPhone14Pro, .iPhone14ProMax: return [.wide, .telephoto, .ultraWide]
        default: return []
        }
    }
    
    /// All devices that feature a camera
    var allDevicesWithCamera: [DeviceModel] {
        return [.iPodTouch5, .iPodTouch6, .iPodTouch7, .iPhone4, .iPhone4S, .iPhone5, .iPhone5C, .iPhone5S, .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhoneSE2, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPhoneSE3, .iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPad7, .iPad8, .iPad9, .iPadAir4, .iPadAir5, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// All devices that feature a normal camera
    @available(*, deprecated, renamed: "allDevicesWithWideCamera")
    static var allDevicesWithNormalCamera: [DeviceModel] {
        return allDevicesWithWideCamera
    }
    
    /// All devices that feature a wide camera
    static var allDevicesWithWideCamera: [DeviceModel] {
        return [.iPodTouch5, .iPodTouch6, .iPodTouch7, .iPhone4, .iPhone4S, .iPhone5, .iPhone5C, .iPhone5S, .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhoneSE2, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPhoneSE3, .iPhone14, .iPhone14Pro,.iPhone14Pro, .iPhone14ProMax, .iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPad7, .iPad8, .iPad9, .iPadAir4, .iPadAir5, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// All devices that feature a telephoto camera
    static var allDevicesWithTelephotoCamera: [DeviceModel] {
        return [.iPhone7Plus, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhone11Pro, .iPhone11ProMax, .iPhone12Pro, .iPhone12ProMax, .iPhone13Pro, .iPhone13ProMax]
    }
    
    /// All devices that feature an ultra wide camera
    static var allDevicesWithUltraWideCamera: [DeviceModel] {
        return [.iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// Returns whether or not the current device has a camera
    public var hasCamera: Bool {
        return !self.cameras.isEmpty
    }
    
    /// Returns whether or not the current device has a normal camera
    @available(*, deprecated, renamed: "hasWideCamera")
    public var hasNormalCamera: Bool {
        return self.hasWideCamera
    }
    
    /// Returns whether or not the current device has a wide camera
    public var hasWideCamera: Bool {
        return self.cameras.contains(.wide)
    }
    
    /// Returns whether or not the current device has a telephoto camera
    public var hasTelephotoCamera: Bool {
        return self.cameras.contains(.telephoto)
    }
    
    /// Returns whether or not the current device has an ultra wide camera
    public var hasUltraWideCamera: Bool {
        return self.cameras.contains(.ultraWide)
    }
    
}
#endif
