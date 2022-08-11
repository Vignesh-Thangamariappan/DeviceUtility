//
//  DeviceUtility+NotchExtension.swift
//  
//
//  Created by Vignesh on 05/02/22.
//

import Foundation
import UIKit

public extension DeviceUtility {
    
    static var notchDevices: [DeviceModel] {
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
        DeviceUtility.notchDevices.contains(model)
    }
    
    /// All iPods
    static var allPods: [DeviceModel] {
        return [.iPodTouch5, .iPodTouch6, .iPodTouch7]
    }
    
    /// All iPhones
    static var allPhones: [DeviceModel] {
        return [.iPhone4, .iPhone4S, .iPhone5, .iPhone5C, .iPhone5S, .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhoneSE2, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax, .iPhoneSE3]
    }
    
    /// All iPads
    static var allPads: [DeviceModel] {
        return [.iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2, .iPad5, .iPad6, .iPadAir3, .iPad7, .iPad8, .iPad9, .iPadAir4, .iPadAir5, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// All X-Series Devices
    @available(*, deprecated, renamed: "allDevicesWithSensorHousing")
    static var allXSeriesDevices: [DeviceModel] {
        return [.iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax, .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax]
    }
    
    /// All Plus and Max-Sized Devices
    static var allPlusSizedDevices: [DeviceModel] {
        return [.iPhone6Plus, .iPhone6SPlus, .iPhone7Plus, .iPhone8Plus, .iPhoneXSMax, .iPhone11ProMax, .iPhone12ProMax, .iPhone13ProMax]
    }
    
    /// All Pro Devices
    static var allProDevices: [DeviceModel] {
        return [.iPhone11Pro, .iPhone11ProMax, .iPhone12Pro, .iPhone12ProMax, .iPhone13Pro, .iPhone13ProMax, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// All mini Devices
    static var allMiniDevices: [DeviceModel] {
        return [.iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadMini6]
    }
    
    /// Returns whether the device is an iPod (real or simulator)
    var isPod: Bool {
        return isOneOf(DeviceUtility.allPods)
    }
    
    /// Returns whether the device is an iPhone (real or simulator)
    var isPhone: Bool {
        return isOneOf(DeviceUtility.allPhones)
    }
    
    /// Returns whether the device is an iPad (real or
    var isPad: Bool {
                    return isOneOf(DeviceUtility.allPads)
    }
    
    /// Returns whether the device is any of the simulator
    /// Useful when there is a need to check and skip running a portion of code (location request or others)
//    public var isSimulator: Bool {
//        return isOneOf(DeviceModel.allSimulators)
//    }
    
    /// If this device is a simulator return the underlying device,
    /// otherwise return `self`.
//    public var realDevice: DeviceModel {
//        return DeviceModel.realDe
//    }
    
//    /// All TVs
//    var allTVs: [DeviceModel] {
//        return [.appleTVHD, .appleTV4K, .appleTV4K2]
//    }
//
//    /// All simulator TVs
//    var allSimulatorTVs: [DeviceModel] {
//        return allTVs.map(DeviceModel.simulator)
//    }
//#elseif os(watchOS)
//    /// All Watches
//    var allWatches: [DeviceModel] {
//        return [.appleWatchSeries0_38mm, .appleWatchSeries0_42mm, .appleWatchSeries1_38mm, .appleWatchSeries1_42mm, .appleWatchSeries2_38mm, .appleWatchSeries2_42mm, .appleWatchSeries3_38mm, .appleWatchSeries3_42mm, .appleWatchSeries4_40mm, .appleWatchSeries4_44mm, .appleWatchSeries5_40mm, .appleWatchSeries5_44mm, .appleWatchSeries6_40mm, .appleWatchSeries6_44mm, .appleWatchSE_40mm, .appleWatchSE_44mm]
//    }
    
    /// All simulator Watches
//    var allSimulatorWatches: [DeviceModel] {
//        return allWatches.map(DeviceModel.simulator)
//    }
//
//    /// All watches that have Force Touch support.
//    var allWatchesWithForceTouchSupport: [DeviceModel] {
//        return [.appleWatchSeries0_38mm, .appleWatchSeries0_42mm, .appleWatchSeries1_38mm, .appleWatchSeries1_42mm, .appleWatchSeries2_38mm, .appleWatchSeries2_42mm, .appleWatchSeries3_38mm, .appleWatchSeries3_42mm, .appleWatchSeries4_40mm, .appleWatchSeries4_44mm, .appleWatchSeries5_40mm, .appleWatchSeries5_44mm]
//    }
    
    /// Returns whether or not the device has Force Touch support.
//    public var hasForceTouchSupport: Bool {
//        return isOneOf(DeviceModel.allWatchesWithForceTouchSupport) || isOneOf(DeviceModel.allWatchesWithForceTouchSupport.map(DeviceModel.simulator))
//    }
//#endif
    
    /// All real devices (i.e. all devices except for all simulators)
    static var allRealDevices: [DeviceModel] {
//#if os(iOS)
        return allPods + allPhones + allPads
//#elseif os(tvOS)
//        return allTVs
//#elseif os(watchOS)
//        return allWatches
//#endif
    }
    
    /// All simulators
//    var allSimulators: [DeviceModel] {
//        return allRealDevices.map(DeviceModel.simulator)
//    }
    
    /**
     This method saves you in many cases from the need of updating your code with every new DeviceModel.
     Most uses for an enum like this are the following:
     ```
     switch DeviceModel.current {
     case .iPodTouch5, .iPodTouch6: callMethodOnIPods()
     case .iPhone4, iPhone4s, .iPhone5, .iPhone5s, .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX: callMethodOnIPhones()
     case .iPad2, .iPad3, .iPad4, .iPadAir, .iPadAir2, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro: callMethodOnIPads()
     default: break
     }
     ```
     This code can now be replaced with
     ```
     let device = DeviceModel.current
     if DeviceModel.isOneOf(DeviceModel.allPods) {
     callMethodOnIPods()
     } else if DeviceModel.isOneOf(DeviceModel.allPhones) {
     callMethodOnIPhones()
     } else if DeviceModel.isOneOf(DeviceModel.allPads) {
     callMethodOnIPads()
     }
     ```
     - parameter devices: An array of devices.
     - returns: Returns whether the current device is one of the passed in ones.
     */
    func isOneOf(_ devices: [DeviceModel]) -> Bool {
        return devices.contains(model)
    }
//
//    // MARK: Current Device
//    /// Whether or not the current device is the current DeviceModel.
//    private var isCurrent: Bool {
//        return self == DeviceModel.current
//    }
    
    /// The name identifying the device (e.g. "Dennis' iPhone").
    var name: String? {
//        guard isCurrent else { return nil }
#if os(watchOS)
        return WKInterfaceDeviceModel.current().name
#else
        return UIDevice.current.name
#endif
    }
    
    /// The name of the operating system running on the device represented by the receiver (e.g. "iOS" or "tvOS").
    var systemName: String? {
//        guard isCurrent else { return nil }
#if os(watchOS)
        return WKInterfaceDeviceModel.current().systemName
#else
        return UIDevice.current.systemName
#endif
    }
    
    /// The current version of the operating system (e.g. 8.4 or 9.2).
    var systemVersion: String? {
//        guard isCurrent else { return nil }
#if os(watchOS)
        return WKInterfaceDeviceModel.current().systemVersion
#else
        return UIDevice.current.systemVersion
#endif
    }
    
    /// The model of the device (e.g. "iPhone" or "iPod Touch").
    var modelString: String? {
//        guard isCurrent else { return nil }
#if os(watchOS)
        return WKInterfaceDeviceModel.current().model
#else
        return UIDevice.current.model
#endif
    }
    
    /// The model of the device as a localized string.
    var localizedModel: String? {
//        guard isCurrent else { return nil }
#if os(watchOS)
        return WKInterfaceDeviceModel.current().localizedModel
#else
        return UIDevice.current.localizedModel
#endif
    }
    
}

// MARK: CustomStringConvertible
extension DeviceModel: CustomStringConvertible {
    
    /// A textual representation of the DeviceModel.
    public var description: String {
#if os(iOS)
        switch self {
        case .iPodTouch5: return "iPod touch (5th generation)"
        case .iPodTouch6: return "iPod touch (6th generation)"
        case .iPodTouch7: return "iPod touch (7th generation)"
        case .iPhone4: return "iPhone 4"
        case .iPhone4S: return "iPhone 4s"
        case .iPhone5: return "iPhone 5"
        case .iPhone5C: return "iPhone 5c"
        case .iPhone5S: return "iPhone 5s"
        case .iPhone6: return "iPhone 6"
        case .iPhone6Plus: return "iPhone 6 Plus"
        case .iPhone6S: return "iPhone 6s"
        case .iPhone6SPlus: return "iPhone 6s Plus"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXS: return "iPhone Xs"
        case .iPhoneXSMax: return "iPhone Xs Max"
        case .iPhoneXR: return "iPhone Xʀ"
        case .iPhone11: return "iPhone 11"
        case .iPhone11Pro: return "iPhone 11 Pro"
        case .iPhone11ProMax: return "iPhone 11 Pro Max"
        case .iPhoneSE2: return "iPhone SE (2nd generation)"
        case .iPhone12: return "iPhone 12"
        case .iPhone12Mini: return "iPhone 12 mini"
        case .iPhone12Pro: return "iPhone 12 Pro"
        case .iPhone12ProMax: return "iPhone 12 Pro Max"
        case .iPhone13: return "iPhone 13"
        case .iPhone13Mini: return "iPhone 13 mini"
        case .iPhone13Pro: return "iPhone 13 Pro"
        case .iPhone13ProMax: return "iPhone 13 Pro Max"
        case .iPhoneSE3: return "iPhone SE (3rd generation)"
        case .iPad2: return "iPad 2"
        case .iPad3: return "iPad (3rd generation)"
        case .iPad4: return "iPad (4th generation)"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPad5: return "iPad (5th generation)"
        case .iPad6: return "iPad (6th generation)"
        case .iPadAir3: return "iPad Air (3rd generation)"
        case .iPad7: return "iPad (7th generation)"
        case .iPad8: return "iPad (8th generation)"
        case .iPad9: return "iPad (9th generation)"
        case .iPadAir4: return "iPad Air (4th generation)"
        case .iPadAir5: return "iPad Air (5th generation)"
        case .iPadMini: return "iPad Mini"
        case .iPadMini2: return "iPad Mini 2"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadMini5: return "iPad Mini (5th generation)"
        case .iPadMini6: return "iPad Mini (6th generation)"
        case .iPadPro9Inch: return "iPad Pro (9.7-inch)"
        case .iPadPro12Inch: return "iPad Pro (12.9-inch)"
        case .iPadPro12Inch2: return "iPad Pro (12.9-inch) (2nd generation)"
        case .iPadPro10Inch: return "iPad Pro (10.5-inch)"
        case .iPadPro11Inch: return "iPad Pro (11-inch)"
        case .iPadPro12Inch3: return "iPad Pro (12.9-inch) (3rd generation)"
        case .iPadPro11Inch2: return "iPad Pro (11-inch) (2nd generation)"
        case .iPadPro12Inch4: return "iPad Pro (12.9-inch) (4th generation)"
        case .iPadPro11Inch3: return "iPad Pro (11-inch) (3rd generation)"
        case .iPadPro12Inch5: return "iPad Pro (12.9-inch) (5th generation)"
       default: return "HomePod"
//        case .simulator(let model): return "Simulator (\(model.description))"
//        case .unknown(let identifier): return identifier
        }
#elseif os(watchOS)
        switch self {
        case .appleWatchSeries0_38mm: return "Apple Watch (1st generation) 38mm"
        case .appleWatchSeries0_42mm: return "Apple Watch (1st generation) 42mm"
        case .appleWatchSeries1_38mm: return "Apple Watch Series 1 38mm"
        case .appleWatchSeries1_42mm: return "Apple Watch Series 1 42mm"
        case .appleWatchSeries2_38mm: return "Apple Watch Series 2 38mm"
        case .appleWatchSeries2_42mm: return "Apple Watch Series 2 42mm"
        case .appleWatchSeries3_38mm: return "Apple Watch Series 3 38mm"
        case .appleWatchSeries3_42mm: return "Apple Watch Series 3 42mm"
        case .appleWatchSeries4_40mm: return "Apple Watch Series 4 40mm"
        case .appleWatchSeries4_44mm: return "Apple Watch Series 4 44mm"
        case .appleWatchSeries5_40mm: return "Apple Watch Series 5 40mm"
        case .appleWatchSeries5_44mm: return "Apple Watch Series 5 44mm"
        case .appleWatchSeries6_40mm: return "Apple Watch Series 6 40mm"
        case .appleWatchSeries6_44mm: return "Apple Watch Series 6 44mm"
        case .appleWatchSE_40mm: return "Apple Watch SE 40mm"
        case .appleWatchSE_44mm: return "Apple Watch SE 44mm"
        case .simulator(let model): return "Simulator (\(model.description))"
        case .unknown(let identifier): return identifier
        }
#elseif os(tvOS)
        switch self {
        case .appleTVHD: return "Apple TV HD"
        case .appleTV4K: return "Apple TV 4K"
        case .appleTV4K2: return "Apple TV 4K (2nd generation)"
        case .simulator(let model): return "Simulator (\(model.description))"
        case .unknown(let identifier): return identifier
        }
#endif
    }
    
    /// A safe version of `description`.
    /// Example:
    /// DeviceModel.iPhoneXR.description:     iPhone Xʀ
    /// DeviceModel.iPhoneXR.safeDescription: iPhone XR
    public var safeDescription: String {
#if os(iOS)
        switch self {
        case .iPodTouch5: return "iPod touch (5th generation)"
        case .iPodTouch6: return "iPod touch (6th generation)"
        case .iPodTouch7: return "iPod touch (7th generation)"
        case .iPhone4: return "iPhone 4"
        case .iPhone4S: return "iPhone 4s"
        case .iPhone5: return "iPhone 5"
        case .iPhone5C: return "iPhone 5c"
        case .iPhone5S: return "iPhone 5s"
        case .iPhone6: return "iPhone 6"
        case .iPhone6Plus: return "iPhone 6 Plus"
        case .iPhone6S: return "iPhone 6s"
        case .iPhone6SPlus: return "iPhone 6s Plus"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXS: return "iPhone XS"
        case .iPhoneXSMax: return "iPhone XS Max"
        case .iPhoneXR: return "iPhone XR"
        case .iPhone11: return "iPhone 11"
        case .iPhone11Pro: return "iPhone 11 Pro"
        case .iPhone11ProMax: return "iPhone 11 Pro Max"
        case .iPhoneSE2: return "iPhone SE (2nd generation)"
        case .iPhone12: return "iPhone 12"
        case .iPhone12Mini: return "iPhone 12 mini"
        case .iPhone12Pro: return "iPhone 12 Pro"
        case .iPhone12ProMax: return "iPhone 12 Pro Max"
        case .iPhone13: return "iPhone 13"
        case .iPhone13Mini: return "iPhone 13 mini"
        case .iPhone13Pro: return "iPhone 13 Pro"
        case .iPhone13ProMax: return "iPhone 13 Pro Max"
        case .iPhoneSE3: return "iPhone SE (3rd generation)"
        case .iPad2: return "iPad 2"
        case .iPad3: return "iPad (3rd generation)"
        case .iPad4: return "iPad (4th generation)"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPad5: return "iPad (5th generation)"
        case .iPad6: return "iPad (6th generation)"
        case .iPadAir3: return "iPad Air (3rd generation)"
        case .iPad7: return "iPad (7th generation)"
        case .iPad8: return "iPad (8th generation)"
        case .iPad9: return "iPad (9th generation)"
        case .iPadAir4: return "iPad Air (4th generation)"
        case .iPadAir5: return "iPad Air (5th generation)"
        case .iPadMini: return "iPad Mini"
        case .iPadMini2: return "iPad Mini 2"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadMini5: return "iPad Mini (5th generation)"
        case .iPadMini6: return "iPad Mini (6th generation)"
        case .iPadPro9Inch: return "iPad Pro (9.7-inch)"
        case .iPadPro12Inch: return "iPad Pro (12.9-inch)"
        case .iPadPro12Inch2: return "iPad Pro (12.9-inch) (2nd generation)"
        case .iPadPro10Inch: return "iPad Pro (10.5-inch)"
        case .iPadPro11Inch: return "iPad Pro (11-inch)"
        case .iPadPro12Inch3: return "iPad Pro (12.9-inch) (3rd generation)"
        case .iPadPro11Inch2: return "iPad Pro (11-inch) (2nd generation)"
        case .iPadPro12Inch4: return "iPad Pro (12.9-inch) (4th generation)"
        case .iPadPro11Inch3: return "iPad Pro (11-inch) (3rd generation)"
        case .iPadPro12Inch5: return "iPad Pro (12.9-inch) (5th generation)"
        default: return "HomePod"
//        case .simulator(let model): return "Simulator (\(model.safeDescription))"
//        case .unknown(let identifier): return identifier
        }
//#elseif os(watchOS)
//        switch self {
//        case .appleWatchSeries0_38mm: return "Apple Watch (1st generation) 38mm"
//        case .appleWatchSeries0_42mm: return "Apple Watch (1st generation) 42mm"
//        case .appleWatchSeries1_38mm: return "Apple Watch Series 1 38mm"
//        case .appleWatchSeries1_42mm: return "Apple Watch Series 1 42mm"
//        case .appleWatchSeries2_38mm: return "Apple Watch Series 2 38mm"
//        case .appleWatchSeries2_42mm: return "Apple Watch Series 2 42mm"
//        case .appleWatchSeries3_38mm: return "Apple Watch Series 3 38mm"
//        case .appleWatchSeries3_42mm: return "Apple Watch Series 3 42mm"
//        case .appleWatchSeries4_40mm: return "Apple Watch Series 4 40mm"
//        case .appleWatchSeries4_44mm: return "Apple Watch Series 4 44mm"
//        case .appleWatchSeries5_40mm: return "Apple Watch Series 5 40mm"
//        case .appleWatchSeries5_44mm: return "Apple Watch Series 5 44mm"
//        case .appleWatchSeries6_40mm: return "Apple Watch Series 6 40mm"
//        case .appleWatchSeries6_44mm: return "Apple Watch Series 6 44mm"
//        case .appleWatchSE_40mm: return "Apple Watch SE 40mm"
//        case .appleWatchSE_44mm: return "Apple Watch SE 44mm"
//        case .simulator(let model): return "Simulator (\(model.safeDescription))"
//        case .unknown(let identifier): return identifier
//        }
//#elseif os(tvOS)
//        switch self {
//        case .appleTVHD: return "Apple TV HD"
//        case .appleTV4K: return "Apple TV 4K"
//        case .appleTV4K2: return "Apple TV 4K (2nd generation)"
//        case .simulator(let model): return "Simulator (\(model.safeDescription))"
//        case .unknown(let identifier): return identifier
//        }
#endif
    }
}
