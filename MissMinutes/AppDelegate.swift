import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover()
    var statusBar: StatusBarController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()

        popover.contentViewController = MainViewController()
        self.popover.contentSize = NSSize(width: 360, height: 360)
        self.popover.contentViewController?.view = NSHostingView(rootView: contentView)

        self.statusBar = StatusBarController(self.popover)
    }
}
