import SwiftUI
import Combine

class Stopwatch: ObservableObject {
    @Published var milliseconds: Int = 0
    @Published var seconds: Int = 0
    @Published var minutes: Int = 0
    @Published var hours: Int = 0
    
    var timer: Timer?
    
    func start() {
        // Invalidate any existing timer.
        self.timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.incrementTime()
        }
    }

    func stop() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func reset() {
        self.milliseconds = 0
        self.seconds = 0
        self.minutes = 0
        self.hours = 0
    }
    
    private func incrementTime() {
        self.milliseconds += 1
        if self.milliseconds == 100 {
            self.milliseconds = 0
            self.seconds += 1
        }
        if self.seconds == 60 {
            self.seconds = 0
            self.minutes += 1
        }
        if self.minutes == 60 {
            self.minutes = 0
            self.hours += 1
        }
    }
}
