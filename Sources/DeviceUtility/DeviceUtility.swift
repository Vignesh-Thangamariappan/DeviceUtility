import UIKit

public class DeviceUtility {
    
    public static let currentDevice = DeviceUtility()
    
    private init() {
        
    }
    
    public var modelIdentifier: String = {
        
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0,
                              count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        let deviceIdentifier: String = String(cString: machine)
        return deviceIdentifier
    }()
    
    public var model: DeviceModel {
        
        let models: [String: DeviceModel] = [
            
            //Simulator
            "i386": .simulator,
            "x86_64": .simulator,
            
            //iPod
            "iPod1,1": .iPod1,
            "iPod2,1": .iPod2,
            "iPod3,1": .iPod3,
            "iPod4,1": .iPod4,
            "iPod5,1": .iPod5,
            "iPod7,1": .iPodTouch6,
            "iPod9,1": .iPodTouch7,
            
            //iPad
            "iPad2,1": .iPad2,
            "iPad2,2": .iPad2,
            "iPad2,3": .iPad2,
            "iPad2,4": .iPad2,
            "iPad3,1": .iPad3,
            "iPad3,2": .iPad3,
            "iPad3,3": .iPad3,
            "iPad3,4": .iPad4,
            "iPad3,5": .iPad4,
            "iPad3,6": .iPad4,
            "iPad6,11": .iPad5, //iPad 2017
            "iPad6,12": .iPad5,
            "iPad7,5": .iPad6, //iPad 2018
            "iPad7,6": .iPad6,
            "iPad7,11": .iPad7,
            "iPad7,12": .iPad7,
            "iPad11,6": .iPad8,
            "iPad11,7": .iPad8,
            
            //iPad Mini
            "iPad2,5": .iPadMini,
            "iPad2,6": .iPadMini,
            "iPad2,7": .iPadMini,
            "iPad4,4": .iPadMini2,
            "iPad4,5": .iPadMini2,
            "iPad4,6": .iPadMini2,
            "iPad4,7": .iPadMini3,
            "iPad4,8": .iPadMini3,
            "iPad4,9": .iPadMini3,
            "iPad5,1": .iPadMini4,
            "iPad5,2": .iPadMini4,
            "iPad11,1": .iPadMini5,
            "iPad11,2": .iPadMini5,
            
            //iPad Pro
            "iPad6,3": .iPadPro9Inch,
            "iPad6,4": .iPadPro9Inch,
            "iPad7,3": .iPadPro10Inch,
            "iPad7,4": .iPadPro10Inch,
            "iPad6,7": .iPadPro12Inch,
            "iPad6,8": .iPadPro12Inch,
            "iPad7,1": .iPadPro12Inch2,
            "iPad7,2": .iPadPro12Inch2,
            "iPad8,1": .iPadPro11Inch,
            "iPad8,2": .iPadPro11Inch,
            "iPad8,3": .iPadPro11Inch,
            "iPad8,4": .iPadPro11Inch,
            "iPad8,5": .iPadPro12Inch3,
            "iPad8,6": .iPadPro12Inch3,
            "iPad8,7": .iPadPro12Inch3,
            "iPad8,8": .iPadPro12Inch3,
            "iPad8,9": .iPadPro11Inch3,
            "iPad8,10": .iPadPro11Inch3,
            "iPad8,11": .iPadPro12Inch4,
            "iPad8,12": .iPadPro12Inch4,
            
            //iPad Air
            "iPad4,1": .iPadAir,
            "iPad4,2": .iPadAir,
            "iPad4,3": .iPadAir,
            "iPad5,3": .iPadAir2,
            "iPad5,4": .iPadAir2,
            "iPad11,3": .iPadAir3,
            "iPad11,4": .iPadAir3,
            "iPad13,1": .iPadAir4,
            "iPad13,2": .iPadAir4,
            "iPad13,16": .iPadAir5,
            "iPad13,17": .iPadAir5,
            
            //iPhone
            "iPhone3,1": .iPhone4,
            "iPhone3,2": .iPhone4,
            "iPhone3,3": .iPhone4,
            "iPhone4,1": .iPhone4S,
            "iPhone5,1": .iPhone5,
            "iPhone5,2": .iPhone5,
            "iPhone5,3": .iPhone5C,
            "iPhone5,4": .iPhone5C,
            "iPhone6,1": .iPhone5S,
            "iPhone6,2": .iPhone5S,
            "iPhone7,1": .iPhone6Plus,
            "iPhone7,2": .iPhone6,
            "iPhone8,1": .iPhone6S,
            "iPhone8,2": .iPhone6SPlus,
            "iPhone8,4": .iPhoneSE,
            "iPhone9,1": .iPhone7,
            "iPhone9,3": .iPhone7,
            "iPhone9,2": .iPhone7Plus,
            "iPhone9,4": .iPhone7Plus,
            "iPhone10,1": .iPhone8,
            "iPhone10,4": .iPhone8,
            "iPhone10,2": .iPhone8Plus,
            "iPhone10,5": .iPhone8Plus,
            "iPhone10,3": .iPhoneX,
            "iPhone10,6": .iPhoneX,
            "iPhone11,2": .iPhoneXS,
            "iPhone11,4": .iPhoneXSMax,
            "iPhone11,6": .iPhoneXSMax,
            "iPhone11,8": .iPhoneXR,
            "iPhone12,1": .iPhone11,
            "iPhone12,3": .iPhone11Pro,
            "iPhone12,5": .iPhone11ProMax,
            "iPhone12,8": .iPhoneSE2,
            "iPhone13,1": .iPhone12Mini,
            "iPhone13,2": .iPhone12,
            "iPhone13,3": .iPhone12Pro,
            "iPhone13,4": .iPhone12ProMax,
            "iPhone14,2": .iPhone13Pro,
            "iPhone14,3": .iPhone13ProMax,
            "iPhone14,4": .iPhone13Mini,
            "iPhone14,5": .iPhone13,
            "iPhone14,6": .iPhoneSE3,
            "iPhone14,7": .iPhone14,
            "iPhone14,8": .iPhone14Plus,
            "iPhone15,2": .iPhone14Pro,
            "iPhone15,3": .iPhone14ProMax,
            "iPad12,2": .iPad9,
            "iPad14,2": .iPadMini6,
            
            //Apple TV
            "AppleTV5,3": .AppleTV,
            "AppleTV6,2": .AppleTV_4K
        ]
        
        guard let model = models[modelIdentifier] else {
            return .unrecognized
        }
        
        
        guard model == .simulator,
           let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"],
           let simModel = models[simModelCode] else {
            return model
        }
        return simModel
    }
}
