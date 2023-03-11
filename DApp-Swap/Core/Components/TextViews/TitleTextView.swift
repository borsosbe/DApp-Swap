import SwiftUI

struct TitleTextView: View {
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.text)
                .underline(color: Color.theme.accent)
        }
        .fixedSize()
    }
    
}

struct LargeTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            TitleTextView(text: "Trade")
        }
    }
}


