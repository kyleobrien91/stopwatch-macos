import SwiftUI

struct ContentView: View {
    @ObservedObject var stopwatch = Stopwatch()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        NSApplication.shared.terminate(self)
                    }) {
                        Text("X")
                            .font(.system(size: 20, weight: .bold))
                            .padding(4)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .focusable(false)
                    .padding(5)
                    .padding(.top, 5)
                    Spacer()
                }
                .padding(.leading, 5)
                Spacer()
            }
            
            VStack {
                Text(String(format: "%02d:%02d:%02d.%02d", stopwatch.hours, stopwatch.minutes, stopwatch.seconds, stopwatch.milliseconds))
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .padding()
                HStack {
                    Button(action: {
                        self.stopwatch.start()
                    }) {
                        CustomButtonView(label: "Start", color: Color.green)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .accessibility(label: Text("Start button"))
                    
                    Button(action: {
                        self.stopwatch.stop()
                    }) {
                        CustomButtonView(label: "Stop", color: Color.red)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .accessibility(label: Text("Stop button"))
                    
                    Button(action: {
                        self.stopwatch.reset()
                    }) {
                        CustomButtonView(label: "Reset", color: Color.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .accessibility(label: Text("Reset button"))
                }
            }
            .padding(.bottom, 40)  // Add padding at the bottom
        }
//        .padding(.top, -20)
        .padding(.bottom, -20)

    }
}
