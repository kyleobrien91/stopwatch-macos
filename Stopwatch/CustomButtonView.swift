import SwiftUI

struct CustomButtonView: View {
    var label: String
    var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 100, height: 44)
                .foregroundColor(color)
            Text(label)
                .foregroundColor(.white)
        }
    }
}
