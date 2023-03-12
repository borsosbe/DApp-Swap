import SwiftUI

struct SwapView: View {
    @State private var swapFromPopover = false
    @State private var swapToPopover = false
    @StateObject private var vm: SwapViewModel
    private let title: LocalizedStringKey = "swapTitle"
    private let reviewButtonTitle: LocalizedStringKey = "reviewTrade"
    private let swapDetailsTitle: LocalizedStringKey = "swapDetails"
    private var panelOrderToggle = false
    
    init() {
        _vm = StateObject(wrappedValue: SwapViewModel())
    }
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack {
                navBar
                    .padding(.bottom)
                ScrollView {
                    if vm.refreshInProgess {
                        LoadingIndicator()
                    }
                    if !vm.refreshInProgess && !vm.tokens.isEmpty {
                        swapPanels
                        swapDetails
                    }
                }
                Spacer()
                Button(action: {
                    vm.onReviewTrade()
                }, label: {
                    RoundedButtonView(title: reviewButtonTitle.localized(), fill: true)
                })
                
            }
            .padding([.leading, .trailing])
        }
        .popover(isPresented: $swapFromPopover) {
            TokenSelectView(tokens: $vm.tokens, selectedToken: $vm.tokenFrom, showingPopover: $swapFromPopover)
        }
        .popover(isPresented: $swapToPopover) {
            TokenSelectView(tokens: $vm.tokens, selectedToken: $vm.tokenTo, showingPopover: $swapToPopover)
        }
        .dynamicTypeSize(.small ... .large)
        .errorAlert(error: $vm.error)
        .onAppear {
            vm.onViewModelAppear()
        }
        .onTapGesture { UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
                    TitleTextView(text: title.localized())
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    vm.onClose()
                }, label: {
                    Image(systemName: "x.circle")
                        .font(.system(size: 30))
                })
            }
            .padding(.trailing)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var swapPanels: some View {
        VStack {
            SwapPanelView(tokens:$vm.tokens, showingPopover: $swapFromPopover, token: $vm.tokenFrom, swapValue: $vm.valueFrom, from: true)
            Button(action: {
                vm.onChangeSwapDirection()
            }, label: {
                Image(systemName: "arrow.down.circle.fill")
                    .foregroundColor(Color.theme.accent)
                    .font(.system(size: 35))
                    .padding(5)
            })
            SwapPanelView(tokens:$vm.tokens, showingPopover: $swapToPopover, token: $vm.tokenTo, swapValue: $vm.valueFrom, from: true)
        }
    }
    
    private var swapDetailTitle: some View {
        HStack {
            Rectangle()
                .fill(
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .leading, endPoint: .trailing)
                )
            CustomTextView(text: swapDetailsTitle.localized(), fontWeight: .bold)
                .fixedSize()
            Rectangle()
                .fill(
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .trailing, endPoint: .leading)
                )
        }
        .frame(height: 1.3)
        .padding()
    }
    
    private var swapDetails: some View {
        VStack {
            swapDetailTitle
                .padding(.bottom)
            List {
                ForEach(vm.swapDetails) { detail in
                    SwapDetailRowView(detail: detail)
                        .listRowSeparator(.hidden)
                }
            }
            .frame(height: CGFloat(vm.swapDetails.count) * CGFloat(30))
            .environment(\.defaultMinListRowHeight, 30)
            .listStyle(.plain)
            .colorScheme(.light)
        }
    }
}
