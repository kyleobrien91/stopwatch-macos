import Cocoa

class DraggableView: NSView {
    
    var startDragLocation: NSPoint?
    
    override func mouseDown(with event: NSEvent) {
        self.startDragLocation = self.window?.convertPoint(fromScreen: event.locationInWindow)
    }
    
    override func mouseDragged(with event: NSEvent) {
        guard let startLocation = self.startDragLocation,
              let window = self.window else { return }
        
        let currentLocation = window.convertPoint(fromScreen: event.locationInWindow)
        let offset = NSPoint(x: currentLocation.x - startLocation.x, y: currentLocation.y - startLocation.y)
        
        var frame = window.frame
        frame.origin.x += offset.x
        frame.origin.y += offset.y
        
        window.setFrame(frame, display: true)
    }
}
