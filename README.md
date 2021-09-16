# DeviceUtility

A Utility framework to access Device related information


<p align="center">
<img src="https://img.shields.io/badge/Platform-iOS10%2B-blue.svg" alt="Platform: iOS 10.0+" />
<a href="https://developer.apple.com/swift" target="_blank"><img src="https://img.shields.io/badge/Language-Swift_5-blueviolet.svg" alt="Language: Swift 5" /></a>
<img src="https://img.shields.io/badge/SPM-Compatible-blue.svg" alt="SPM compatible" /></a>
<img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT" />
</p>

<p align="center">
 <a href="#requirements">Requirements</a>
• <a href="#usage">Usage</a>
• <a href="#installation">Installation</a>
• <a href="#author">Author</a>
• <a href="#license">Licence</a>
</p>

## Requirements

DeviceUtility requires **iOS 10+** and is compatible with **Swift 5** projects.

## Usage

DeviceUtility can be used to obtain Device related Information. The Device Info can be access through DeviceUtility.currentDevice.


### Identify the Device Model:

```
DeviceUtility.currentDevice.model
```

### Identify whether the current device has a notch or not.

```
DeviceUtility.currentDevice.hasNotch
```

## Installation

DeviceUtility is available through [SPM](https://swift.org/package-manager). To install
it, simply add the following line to your package.swift file:

```
.package(url: "https://github.com/Vignesh-Thangamariappan/DeviceUtility.git", .upToNextMajor(from: "0.1.0"))
```

## Author

vignesh_thangamariappan, vignesh.thangamariappan@gmail.com

## License

DeviceUtility is available under the MIT license. See the LICENSE file for more info.
