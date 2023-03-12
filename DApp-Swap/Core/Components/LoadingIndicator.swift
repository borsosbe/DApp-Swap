import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ProgressView()
            .tint(Color.theme.accent)
            .scaleEffect(x: 1, y: 1, anchor: .center)
            .background(Color.theme.background)
            .cornerRadius(5)
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
