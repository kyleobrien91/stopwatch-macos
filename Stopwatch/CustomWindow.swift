import Cocoa

class CustomWindow: NSWindow {
    override func awakeFromNib() {
        super.awakeFromNib()

        self.level = .floating
        self.styleMask.remove([.closable, .resizable, .miniaturizable])
        self.setContentSize(NSSize(width: 380, height: 170))
        
        // Enable mouse events
        self.acceptsMouseMovedEvents = true
    }
    
    var initialLocation: NSPoint?
    
    override func mouseDown(with event: NSEvent) {
        self.initialLocation = self.convertPoint(toScreen: event.locationInWindow)
    }
    
    override func mouseDragged(with event: NSEvent) {
        guard let initialLocation = self.initialLocation else { return }
        
        let currentLocation = self.convertPoint(toScreen: event.locationInWindow)
        var newOrigin = self.frame.origin
        
        // Update the origin with the difference between new and initial positions
        newOrigin.x += (currentLocation.x - initialLocation.x)
        newOrigin.y += (currentLocation.y - initialLocation.y)
        
        // Set the new origin
        self.setFrameOrigin(newOrigin)
        
        // Update the initial location for the next drag
        self.initialLocation = self.convertPoint(toScreen: event.locationInWindow)
    }
}
