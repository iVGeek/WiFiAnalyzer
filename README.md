# WiFi Health and Speed Monitor

WiFi Health and Speed Monitor is a macOS application written in Swift that allows you to monitor the health and speed of WiFi connections. It provides real-time information about the WiFi link, including signal strength, transmit rate, and channel number. The application utilizes the CoreWLAN framework for gathering WiFi-related data.

## Features

- Real-time monitoring of WiFi link changes
- Display of essential information such as SSID, BSSID, RSSI, transmit rate, and channel
- Easy integration into macOS apps

## Requirements

- macOS development environment
- Xcode with Swift support
- CoreWLAN.framework

## Getting Started

1. Clone or download the repository.
2. Open the Xcode project file.
3. Ensure that the necessary entitlements and frameworks are set up correctly.
4. Add the provided WiFi monitoring code to your project.
5. Customize and extend the functionality as per your requirements.

## Usage Example

To use the WiFi Health and Speed Monitor in your macOS app:

1. Initialize an instance of the `WiFiMonitor` class.
2. Call the `startMonitoring()` method to begin monitoring the WiFi link.
3. Implement the appropriate logic to handle WiFi link changes and display the desired information.
4. Call the `stopMonitoring()` method to stop monitoring when no longer needed.

```swift
// Initialize the WiFiMonitor
if let wifiMonitor = WiFiMonitor() {
    wifiMonitor.startMonitoring()

    // Implement logic to handle WiFi link changes and display information

    wifiMonitor.stopMonitoring()
}
