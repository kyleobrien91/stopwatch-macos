import SwiftUI

class CustomHostingView<Content>: NSHostingView<Content> where Content: View {
    
    override func hitTest(_ point: NSPoint) -> NSView? {
        return self
    }
    
    override func mouseDown(with event: NSEvent) {
        self.window?.performDrag(with: event)
    }
    
}
