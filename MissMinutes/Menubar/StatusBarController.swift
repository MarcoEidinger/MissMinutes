import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var popover: NSPopover
    private var eventMonitor: EventMonitor?

    init(_ popover: NSPopover) {
        self.popover = popover
        self.statusBar = NSStatusBar()
        self.statusItem = self.statusBar.statusItem(withLength: 28.0)

        if let statusBarButton = statusItem.button {
            if #available(macOS 11.0, *) {
                statusBarButton.image = NSImage(systemSymbolName: "clock", accessibilityDescription: "Clock")
            } else {
                statusBarButton.image = NSImage(imageLiteralResourceName: "StatusBarIcon")
            }
            statusBarButton.image?.size = NSSize(width: 18.0, height: 18.0)
            statusBarButton.image?.isTemplate = true

            statusBarButton.action = #selector(self.togglePopover(sender:))
            statusBarButton.target = self
        }

        self.eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown], handler: self.mouseEventHandler)
    }

    @objc func togglePopover(sender: AnyObject) {
        if self.popover.isShown {
            self.hidePopover(sender)
        } else {
            self.showPopover(sender)
        }
    }

    func showPopover(_ sender: AnyObject) {
        if let statusBarButton = statusItem.button {
            self.popover.show(relativeTo: statusBarButton.bounds, of: statusBarButton, preferredEdge: NSRectEdge.maxY)
            self.eventMonitor?.start()
        }
    }

    func hidePopover(_ sender: AnyObject) {
        self.popover.performClose(sender)
        self.eventMonitor?.stop()
    }

    func mouseEventHandler(_ event: NSEvent?) {
        if self.popover.isShown {
            self.hidePopover(event!)
        }
    }
}
