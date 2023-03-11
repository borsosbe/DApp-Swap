import SwiftUI

struct CustomTextView: View {
    let text: String
    var font: Font = .body
    var fontWeight: Font.Weight = .regular
    var textColor: Color = Color.theme.text
    var image: Image? = nil
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(fontWeight)
            .foregroundColor(textColor)
    }
}

struct BodyTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            CustomTextView(text: "Swap from")
        }
    }
}
