import SwiftUI

@main
struct StopwatchApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings { // Using Settings to fulfill the Scene requirement
            EmptyView()
        }
    }
}
