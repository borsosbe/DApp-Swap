import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ProgressView()
            .tint(Color.theme.accent)
            .scaleEffect(x: 1.5, y: 1.5, anchor: .center)
            .padding(10)
            .background(Color.theme.background)
            .cornerRadius(5)
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
