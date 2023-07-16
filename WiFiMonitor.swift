import Foundation
import CoreWLAN

class WiFiMonitor {
    let wifiInterface: CWInterface
    
    init?() {
        guard let interface = CWWiFiClient.shared().interface() else {
            print("WiFi interface not found")
            return nil
        }
        wifiInterface = interface
    }
    
    func startMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .CWLinkDidChange, object: nil)
        wifiInterface.startMonitoringEvent(with: .linkDidChange)
    }
    
    func stopMonitoring() {
        NotificationCenter.default.removeObserver(self, name: .CWLinkDidChange, object: nil)
        wifiInterface.stopMonitoringEvent(with: .linkDidChange)
    }
    
    @objc func handleNotification(_ notification: Notification) {
        if let interface = notification.object as? CWInterface {
            print("WiFi link changed:")
            print("SSID: \(interface.ssid ?? "N/A")")
            print("BSSID: \(interface.bssid ?? "N/A")")
            print("RSSI: \(interface.rssiValue()) dBm")
            print("Transmit Rate: \(interface.transmitRate()) Mbps")
            print("Channel: \(interface.wlanChannel()?.channelNumber ?? 0)")
        }
    }
}

// Usage Example:
if let wifiMonitor = WiFiMonitor() {
    wifiMonitor.startMonitoring()
    
    // Keep the app running for monitoring
    RunLoop.current.run()
}
