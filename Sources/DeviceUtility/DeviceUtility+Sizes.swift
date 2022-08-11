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
    
    var diagonal: Double {
        #if os(iOS)
        switch self.model {
            case .iPodTouch5: return 4
            case .iPodTouch6: return 4
            case .iPodTouch7: return 4
            case .iPhone4: return 3.5
            case .iPhone4S: return 3.5
            case .iPhone5: return 4
            case .iPhone5C: return 4
            case .iPhone5S: return 4
            case .iPhone6: return 4.7
            case .iPhone6Plus: return 5.5
            case .iPhone6S: return 4.7
            case .iPhone6SPlus: return 5.5
            case .iPhone7: return 4.7
            case .iPhone7Plus: return 5.5
            case .iPhoneSE: return 4
            case .iPhone8: return 4.7
            case .iPhone8Plus: return 5.5
            case .iPhoneX: return 5.8
            case .iPhoneXS: return 5.8
            case .iPhoneXSMax: return 6.5
            case .iPhoneXR: return 6.1
            case .iPhone11: return 6.1
            case .iPhone11Pro: return 5.8
            case .iPhone11ProMax: return 6.5
            case .iPhoneSE2: return 4.7
            case .iPhone12: return 6.1
            case .iPhone12Mini: return 5.4
            case .iPhone12Pro: return 6.1
            case .iPhone12ProMax: return 6.7
            case .iPhone13: return 6.1
            case .iPhone13Mini: return 5.4
            case .iPhone13Pro: return 6.1
            case .iPhone13ProMax: return 6.7
            case .iPhoneSE3: return 4.7
            case .iPad2: return 9.7
            case .iPad3: return 9.7
            case .iPad4: return 9.7
            case .iPadAir: return 9.7
            case .iPadAir2: return 9.7
            case .iPad5: return 9.7
            case .iPad6: return 9.7
            case .iPadAir3: return 10.5
            case .iPad7: return 10.2
            case .iPad8: return 10.2
            case .iPad9: return 10.2
            case .iPadAir4: return 10.9
            case .iPadAir5: return 10.9
            case .iPadMini: return 7.9
            case .iPadMini2: return 7.9
            case .iPadMini3: return 7.9
            case .iPadMini4: return 7.9
            case .iPadMini5: return 7.9
            case .iPadMini6: return 8.3
            case .iPadPro9Inch: return 9.7
            case .iPadPro12Inch: return 12.9
            case .iPadPro12Inch2: return 12.9
            case .iPadPro10Inch: return 10.5
            case .iPadPro11Inch: return 11.0
            case .iPadPro12Inch3: return 12.9
            case .iPadPro11Inch2: return 11.0
            case .iPadPro12Inch4: return 12.9
            case .iPadPro11Inch3: return 11.0
            case .iPadPro12Inch5: return 12.9
//            case .homePod: return -1
//            case .simulator(let model): return model.diagonal
//            case .unknown: return -1
        default: return 12
        }
        #elseif os(watchOS)
          switch self {
          case .appleWatchSeries0_38mm: return 1.5
          case .appleWatchSeries0_42mm: return 1.6
          case .appleWatchSeries1_38mm: return 1.5
          case .appleWatchSeries1_42mm: return 1.6
          case .appleWatchSeries2_38mm: return 1.5
          case .appleWatchSeries2_42mm: return 1.6
          case .appleWatchSeries3_38mm: return 1.5
          case .appleWatchSeries3_42mm: return 1.6
          case .appleWatchSeries4_40mm: return 1.8
          case .appleWatchSeries4_44mm: return 2.0
          case .appleWatchSeries5_40mm: return 1.8
          case .appleWatchSeries5_44mm: return 2.0
          case .appleWatchSeries6_40mm: return 1.8
          case .appleWatchSeries6_44mm: return 2.0
          case .appleWatchSE_40mm: return 1.8
          case .appleWatchSE_44mm: return 2.0
          case .simulator(let model): return model.diagonal
          case .unknown: return -1
          }
        #endif
      }

      /// Returns screen ratio as a tuple
    var screenRatio: (width: Double, height: Double) {
        #if os(iOS)
          switch model {
          case .iPodTouch5: return (width: 9, height: 16)
          case .iPodTouch6: return (width: 9, height: 16)
          case .iPodTouch7: return (width: 9, height: 16)
          case .iPhone4: return (width: 2, height: 3)
          case .iPhone4S: return (width: 2, height: 3)
          case .iPhone5: return (width: 9, height: 16)
          case .iPhone5C: return (width: 9, height: 16)
          case .iPhone5S: return (width: 9, height: 16)
          case .iPhone6: return (width: 9, height: 16)
          case .iPhone6Plus: return (width: 9, height: 16)
          case .iPhone6S: return (width: 9, height: 16)
          case .iPhone6SPlus: return (width: 9, height: 16)
          case .iPhone7: return (width: 9, height: 16)
          case .iPhone7Plus: return (width: 9, height: 16)
          case .iPhoneSE: return (width: 9, height: 16)
          case .iPhone8: return (width: 9, height: 16)
          case .iPhone8Plus: return (width: 9, height: 16)
          case .iPhoneX: return (width: 9, height: 19.5)
          case .iPhoneXS: return (width: 9, height: 19.5)
          case .iPhoneXSMax: return (width: 9, height: 19.5)
          case .iPhoneXR: return (width: 9, height: 19.5)
          case .iPhone11: return (width: 9, height: 19.5)
          case .iPhone11Pro: return (width: 9, height: 19.5)
          case .iPhone11ProMax: return (width: 9, height: 19.5)
          case .iPhoneSE2: return (width: 9, height: 16)
          case .iPhone12: return (width: 9, height: 19.5)
          case .iPhone12Mini: return (width: 9, height: 19.5)
          case .iPhone12Pro: return (width: 9, height: 19.5)
          case .iPhone12ProMax: return (width: 9, height: 19.5)
          case .iPhone13: return (width: 9, height: 19.5)
          case .iPhone13Mini: return (width: 9, height: 19.5)
          case .iPhone13Pro: return (width: 9, height: 19.5)
          case .iPhone13ProMax: return (width: 9, height: 19.5)
          case .iPhoneSE3: return (width: 9, height: 16)
          case .iPad2: return (width: 3, height: 4)
          case .iPad3: return (width: 3, height: 4)
          case .iPad4: return (width: 3, height: 4)
          case .iPadAir: return (width: 3, height: 4)
          case .iPadAir2: return (width: 3, height: 4)
          case .iPad5: return (width: 3, height: 4)
          case .iPad6: return (width: 3, height: 4)
          case .iPadAir3: return (width: 3, height: 4)
          case .iPad7: return (width: 3, height: 4)
          case .iPad8: return (width: 3, height: 4)
          case .iPad9: return (width: 3, height: 4)
          case .iPadAir4: return (width: 41, height: 59)
          case .iPadAir5: return (width: 41, height: 59)
          case .iPadMini: return (width: 3, height: 4)
          case .iPadMini2: return (width: 3, height: 4)
          case .iPadMini3: return (width: 3, height: 4)
          case .iPadMini4: return (width: 3, height: 4)
          case .iPadMini5: return (width: 3, height: 4)
          case .iPadMini6: return (width: 744, height: 1133)
          case .iPadPro9Inch: return (width: 3, height: 4)
          case .iPadPro12Inch: return (width: 3, height: 4)
          case .iPadPro12Inch2: return (width: 3, height: 4)
          case .iPadPro10Inch: return (width: 3, height: 4)
          case .iPadPro11Inch: return (width: 139, height: 199)
          case .iPadPro12Inch3: return (width: 512, height: 683)
          case .iPadPro11Inch2: return (width: 139, height: 199)
          case .iPadPro12Inch4: return (width: 512, height: 683)
          case .iPadPro11Inch3: return (width: 139, height: 199)
          case .iPadPro12Inch5: return (width: 512, height: 683)
//          case .homePod: return (width: 4, height: 5)
//          case .simulator(let model): return model.screenRatio
          default: return (width: -1, height: -1)
          }
        #elseif os(watchOS)
          switch self {
          case .appleWatchSeries0_38mm: return (width: 4, height: 5)
          case .appleWatchSeries0_42mm: return (width: 4, height: 5)
          case .appleWatchSeries1_38mm: return (width: 4, height: 5)
          case .appleWatchSeries1_42mm: return (width: 4, height: 5)
          case .appleWatchSeries2_38mm: return (width: 4, height: 5)
          case .appleWatchSeries2_42mm: return (width: 4, height: 5)
          case .appleWatchSeries3_38mm: return (width: 4, height: 5)
          case .appleWatchSeries3_42mm: return (width: 4, height: 5)
          case .appleWatchSeries4_40mm: return (width: 4, height: 5)
          case .appleWatchSeries4_44mm: return (width: 4, height: 5)
          case .appleWatchSeries5_40mm: return (width: 4, height: 5)
          case .appleWatchSeries5_44mm: return (width: 4, height: 5)
          case .appleWatchSeries6_40mm: return (width: 4, height: 5)
          case .appleWatchSeries6_44mm: return (width: 4, height: 5)
          case .appleWatchSE_40mm: return (width: 4, height: 5)
          case .appleWatchSE_44mm: return (width: 4, height: 5)
          case .simulator(let model): return model.screenRatio
          case .unknown: return (width: -1, height: -1)
          }
        #elseif os(tvOS)
          return (width: -1, height: -1)
        #endif
      }

    /// PPI (Pixels per Inch) on the current device's screen (if applicable). When the device is not applicable this property returns nil.
    var ppi: Int? {
        switch model {
        case .iPodTouch5: return 326
        case .iPodTouch6: return 326
        case .iPodTouch7: return 326
        case .iPhone4: return 326
        case .iPhone4S: return 326
        case .iPhone5: return 326
        case .iPhone5C: return 326
        case .iPhone5S: return 326
        case .iPhone6: return 326
        case .iPhone6Plus: return 401
        case .iPhone6S: return 326
        case .iPhone6SPlus: return 401
        case .iPhone7: return 326
        case .iPhone7Plus: return 401
        case .iPhoneSE: return 326
        case .iPhone8: return 326
        case .iPhone8Plus: return 401
        case .iPhoneX: return 458
        case .iPhoneXS: return 458
        case .iPhoneXSMax: return 458
        case .iPhoneXR: return 326
        case .iPhone11: return 326
        case .iPhone11Pro: return 458
        case .iPhone11ProMax: return 458
        case .iPhoneSE2: return 326
        case .iPhone12: return 460
        case .iPhone12Mini: return 476
        case .iPhone12Pro: return 460
        case .iPhone12ProMax: return 458
        case .iPhone13: return 460
        case .iPhone13Mini: return 476
        case .iPhone13Pro: return 460
        case .iPhone13ProMax: return 458
        case .iPhoneSE3: return 326
        case .iPad2: return 132
        case .iPad3: return 264
        case .iPad4: return 264
        case .iPadAir: return 264
        case .iPadAir2: return 264
        case .iPad5: return 264
        case .iPad6: return 264
        case .iPadAir3: return 264
        case .iPad7: return 264
        case .iPad8: return 264
        case .iPad9: return 264
        case .iPadAir4: return 264
        case .iPadAir5: return 264
        case .iPadMini: return 163
        case .iPadMini2: return 326
        case .iPadMini3: return 326
        case .iPadMini4: return 326
        case .iPadMini5: return 326
        case .iPadMini6: return 326
        case .iPadPro9Inch: return 264
        case .iPadPro12Inch: return 264
        case .iPadPro12Inch2: return 264
        case .iPadPro10Inch: return 264
        case .iPadPro11Inch: return 264
        case .iPadPro12Inch3: return 264
        case .iPadPro11Inch2: return 264
        case .iPadPro12Inch4: return 264
        case .iPadPro11Inch3: return 264
        case .iPadPro12Inch5: return 264
//        case .homePod: return -1
//        case .simulator(let model): return model.ppi
       default: return nil
        }
    }
}
