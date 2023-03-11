import SwiftUI

struct RoundedButtonView: View {
    let title: String
    let fill: Bool
    
    var body: some View {
        Text(title)
            .foregroundColor(fill ? Color.theme.background : Color.theme.accent)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding(fill ? 15 : 5)
            .background(fill ? Color.theme.accent : Color.theme.background)
            .clipShape(Capsule())
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.theme.accent, lineWidth: fill ? 0 : 2)
            )
    }
}

struct RoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButtonView(title: "Round Me", fill: false)
                .previewLayout(.sizeThatFits)
    }
}
