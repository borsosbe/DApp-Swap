import SwiftUI

struct SwapView: View {
    @StateObject private var vm: SwapViewModel
    private let title: LocalizedStringKey = "swap_title"
    
    init() {
        _vm = StateObject(wrappedValue: SwapViewModel())
    }
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack(alignment: .center) {
                if vm.refreshInProgess {
                    LoadingIndicator()
                }
                if !vm.refreshInProgess && !vm.tokens.isEmpty {
                    navBar
                    Spacer()
                    VStack {
                        SwapPanelView(token: TokenModel(id: 0, name: "USDT"), from: true)
                        SwapPanelView(token: TokenModel(id: 0, name: "USDT"), from: false)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    Spacer()
                }
            }
        }
        .errorAlert(error: $vm.error)
        .onAppear {
            vm.onViewModelAppear()
        }
    }
}

struct SwapView_Previews: PreviewProvider {
    static var previews: some View {
        SwapView()
    }
}

extension SwapView {
    private var navBar: some View {
        ZStack {
            HStack {
                Spacer()
                VStack{
                    TitleTextView(text: "Trade")
                }
                .fixedSize()
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    vm.close()
                }, label: {
                    Image(systemName: "x.circle")
                        .font(.system(size: 30))
                })
            }
            .padding(.trailing)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
