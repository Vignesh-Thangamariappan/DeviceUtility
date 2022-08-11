//
//  File 2.swift
//  
//
//  Created by Vignesh on 12/08/22.
//

import UIKit


// MARK: Equatable
extension DeviceModel: Equatable {
    
    /// Compares two devices
    ///
    /// - parameter lhs: A DeviceModel.
    /// - parameter rhs: Another DeviceModiPad7iPad7el.
    ///
    /// - returns: `true` iff the underlying identifier is the same.
    static public func == (lhs: DeviceModel, rhs: DeviceModel) -> Bool {
        return lhs.description == rhs.description
    }
}


// MARK: Battery
#if os(iOS) || os(watchOS)
@available(iOS 8.0, watchOS 4.0, *)
extension DeviceModel {
    /**
     This enum describes the state of the battery.
     - Full:      The device is plugged into power and the battery is 100% charged or the device is the iOS Simulator.
     - Charging:  The device is plugged into power and the battery is less than 100% charged.
     - Unplugged: The device is not plugged into power; the battery is discharging.
     */
    public enum BatteryState: CustomStringConvertible, Equatable {
        /// The device is plugged into power and the battery is 100% charged or the device is the iOS Simulator.
        case full
        /// The device is plugged into power and the battery is less than 100% charged.
        /// The associated value is in percent (0-100).
        case charging(Int)
        /// The device is not plugged into power; the battery is discharging.
        /// The associated value is in percent (0-100).
        case unplugged(Int)
        
#if os(iOS)
        fileprivate init() {
            let wasBatteryMonitoringEnabled = UIDevice.current.isBatteryMonitoringEnabled
            UIDevice.current.isBatteryMonitoringEnabled = true
            let batteryLevel = Int(round(UIDevice.current.batteryLevel * 100)) // round() is actually not needed anymore since -[batteryLevel] seems to always return a two-digit precision number
            // but maybe that changes in the future.
            switch UIDevice.current.batteryState {
            case .charging: self = .charging(batteryLevel)
            case .full: self = .full
            case .unplugged: self = .unplugged(batteryLevel)
            case .unknown: self = .full // Should never happen since `batteryMonitoring` is enabled.
            @unknown default:
                self = .full // To cover any future additions for which DeviceKit might not have updated yet.
            }
            UIDevice.current.isBatteryMonitoringEnabled = wasBatteryMonitoringEnabled
        }
#elseif os(watchOS)
        fileprivate init() {
            let wasBatteryMonitoringEnabled = WKInterfaceDeviceModel.current().isBatteryMonitoringEnabled
            WKInterfaceDeviceModel.current().isBatteryMonitoringEnabled = true
            let batteryLevel = Int(round(WKInterfaceDeviceModel.current().batteryLevel * 100)) // round() is actually not needed anymore since -[batteryLevel] seems to always return a two-digit precision number
            // but maybe that changes in the future.
            switch WKInterfaceDeviceModel.current().batteryState {
            case .charging: self = .charging(batteryLevel)
            case .full: self = .full
            case .unplugged: self = .unplugged(batteryLevel)
            case .unknown: self = .full // Should never happen since `batteryMonitoring` is enabled.
            @unknown default:
                self = .full // To cover any future additions for which DeviceKit might not have updated yet.
            }
            WKInterfaceDeviceModel.current().isBatteryMonitoringEnabled = wasBatteryMonitoringEnabled
        }
#endif
        
        /// The user enabled Low Power mode
        public var lowPowerMode: Bool {
            return ProcessInfo.processInfo.isLowPowerModeEnabled
        }
        
        /// Provides a textual representation of the battery state.
        /// Examples:
        /// ```
        /// Battery level: 90%, device is plugged in.
        /// Battery level: 100 % (Full), device is plugged in.
        /// Battery level: \(batteryLevel)%, device is unplugged.
        /// ```
        public var description: String {
            switch self {
            case .charging(let batteryLevel): return "Battery level: \(batteryLevel)%, device is plugged in."
            case .full: return "Battery level: 100 % (Full), device is plugged in."
            case .unplugged(let batteryLevel): return "Battery level: \(batteryLevel)%, device is unplugged."
            }
        }
        
    }
    
    /// The state of the battery
    public var batteryState: BatteryState? {
//        guard isCurrent else { return nil }
        return BatteryState()
    }
    
    /// Battery level ranges from 0 (fully discharged) to 100 (100% charged).
    public var batteryLevel: Int? {
//        guard isCurrent else { return nil }
        switch BatteryState() {
        case .charging(let value): return value
        case .full: return 100
        case .unplugged(let value): return value
        }
    }
    
}
#endif

// MARK: DeviceModel.Batterystate: Comparable
#if os(iOS) || os(watchOS)
@available(iOS 8.0, watchOS 4.0, *)
extension DeviceModel.BatteryState: Comparable {
    /// Tells if two battery states are equal.
    ///
    /// - parameter lhs: A battery state.
    /// - parameter rhs: Another battery state.
    ///
    /// - returns: `true` iff they are equal, otherwise `false`
    public static func == (lhs: DeviceModel.BatteryState, rhs: DeviceModel.BatteryState) -> Bool {
        return lhs.description == rhs.description
    }
    
    /// Compares two battery states.
    ///
    /// - parameter lhs: A battery state.
    /// - parameter rhs: Another battery state.
    ///
    /// - returns: `true` if rhs is `.Full`, `false` when lhs is `.Full` otherwise their battery level is compared.
    public static func < (lhs: DeviceModel.BatteryState, rhs: DeviceModel.BatteryState) -> Bool {
        switch (lhs, rhs) {
        case (.full, _): return false // return false (even if both are `.Full` -> they are equal)
        case (_, .full): return true // lhs is *not* `.Full`, rhs is
        case let (.charging(lhsLevel), .charging(rhsLevel)): return lhsLevel < rhsLevel
        case let (.charging(lhsLevel), .unplugged(rhsLevel)): return lhsLevel < rhsLevel
        case let (.unplugged(lhsLevel), .charging(rhsLevel)): return lhsLevel < rhsLevel
        case let (.unplugged(lhsLevel), .unplugged(rhsLevel)): return lhsLevel < rhsLevel
        default: return false // compiler won't compile without it, though it cannot happen
        }
    }
}
#endif

#if os(iOS)
extension DeviceModel {
    // MARK: Orientation
    /**
     This enum describes the state of the orientation.
     - Landscape: The device is in Landscape Orientation
     - Portrait:  The device is in Portrait Orientation
     */
    public enum Orientation {
        case landscape
        case portrait
    }
    
    public var orientation: Orientation {
        if UIDevice.current.orientation.isLandscape {
            return .landscape
        } else {
            return .portrait
        }
    }
}
#endif

#if os(iOS)
// MARK: DiskSpace
extension DeviceModel {
    
    /// Return the root url
    ///
    /// - returns: the NSHomeDirectory() url
    private static let rootURL = URL(fileURLWithPath: NSHomeDirectory())
    
    /// The volume’s total capacity in bytes.
    var volumeTotalCapacity: Int? {
        return (try? DeviceModel.rootURL.resourceValues(forKeys: [.volumeTotalCapacityKey]))?.volumeTotalCapacity
    }
    
    /// The volume’s available capacity in bytes.
    static var volumeAvailableCapacity: Int? {
        return (try? DeviceModel.rootURL.resourceValues(forKeys: [.volumeAvailableCapacityKey]))?.volumeAvailableCapacity
    }
    
    /// The volume’s available capacity in bytes for storing important resources.
    @available(iOS 11.0, *)
    static var volumeAvailableCapacityForImportantUsage: Int64? {
        return (try? rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey]))?.volumeAvailableCapacityForImportantUsage
    }
    
    /// The volume’s available capacity in bytes for storing nonessential resources.
    @available(iOS 11.0, *)
    static var volumeAvailableCapacityForOpportunisticUsage: Int64? { //swiftlint:disable:this identifier_name
        return (try? rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForOpportunisticUsageKey]))?.volumeAvailableCapacityForOpportunisticUsage
    }
    
    /// All volumes capacity information in bytes.
    @available(iOS 11.0, *)
    static var volumes: [URLResourceKey: Int64]? {
        do {
            let values = try rootURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey,
                                                              .volumeAvailableCapacityKey,
                                                              .volumeAvailableCapacityForOpportunisticUsageKey,
                                                              .volumeTotalCapacityKey
            ])
            return values.allValues.mapValues {
                if let int = $0 as? Int64 {
                    return int
                }
                if let int = $0 as? Int {
                    return Int64(int)
                }
                return 0
            }
        } catch {
            return nil
        }
    }
}
#endif

#if os(iOS)
// MARK: Apple Pencil
extension DeviceModel {
    
    /**
     This option set describes the current Apple Pencils
     - firstGeneration:  1st Generation Apple Pencil
     - secondGeneration: 2nd Generation Apple Pencil
     */
    public struct ApplePencilSupport: OptionSet {
        
        public var rawValue: UInt
        
        public init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        public static let firstGeneration = ApplePencilSupport(rawValue: 0x01)
        public static let secondGeneration = ApplePencilSupport(rawValue: 0x02)
    }
    
    /// All Apple Pencil Capable Devices
    var allApplePencilCapableDevices: [DeviceModel] {
        return [.iPad6, .iPadAir3, .iPad7, .iPad8, .iPad9, .iPadAir4, .iPadAir5, .iPadMini5, .iPadMini6, .iPadPro9Inch, .iPadPro12Inch, .iPadPro12Inch2, .iPadPro10Inch, .iPadPro11Inch, .iPadPro12Inch3, .iPadPro11Inch2, .iPadPro12Inch4, .iPadPro11Inch3, .iPadPro12Inch5]
    }
    
    /// Returns supported version of the Apple Pencil
    public var applePencilSupport: ApplePencilSupport {
        switch self {
        case .iPad6: return .firstGeneration
        case .iPadAir3: return .firstGeneration
        case .iPad7: return .firstGeneration
        case .iPad8: return .firstGeneration
        case .iPad9: return .firstGeneration
        case .iPadMini5: return .firstGeneration
        case .iPadPro9Inch: return .firstGeneration
        case .iPadPro12Inch: return .firstGeneration
        case .iPadPro12Inch2: return .firstGeneration
        case .iPadPro10Inch: return .firstGeneration
        case .iPadAir4: return .secondGeneration
        case .iPadAir5: return .secondGeneration
        case .iPadMini6: return .secondGeneration
        case .iPadPro11Inch: return .secondGeneration
        case .iPadPro12Inch3: return .secondGeneration
        case .iPadPro11Inch2: return .secondGeneration
        case .iPadPro12Inch4: return .secondGeneration
        case .iPadPro11Inch3: return .secondGeneration
        case .iPadPro12Inch5: return .secondGeneration
//        case .simulator(let model): return model.applePencilSupport
        default: return []
        }
    }
}
#endif
