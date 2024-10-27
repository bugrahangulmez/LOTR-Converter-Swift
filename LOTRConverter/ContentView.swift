import SwiftUI
import TipKit

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var showInfoView = false
    @State var showSelectCurrencyView = false
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                // Top image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                // Header
                Text("Currency Exchange")
                    .font(.title)
                    .foregroundColor(.white)
                // Exchange view
                HStack {
                    // Left
                    VStack {
                        // Row
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        // Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                    }
                    
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.title)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right
                    VStack {
                        // Row
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)

                        }
                        // Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                    }
                }
                .popoverTip(CurrencyTip())
                .onTapGesture {
                    showSelectCurrencyView.toggle()
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                // Info button
                HStack {
                    Spacer()
                    Button(action: {
                        showInfoView.toggle()
                    }) {
                        Image(systemName: "info.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                .onTapGesture {
                    showSelectCurrencyView.toggle()
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .sheet(isPresented: $showInfoView) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrencyView) {
            SelectCurrency(upCurrency: $leftCurrency, downCurrency: $rightCurrency)
        }
        .onChange(of: leftAmount) { oldValue, newValue in
            if leftTyping {
                rightAmount = leftCurrency.convert(convertedAmount: leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: leftCurrency) { oldValue, newValue in
            rightAmount = leftCurrency.convert(convertedAmount: leftAmount, to: rightCurrency)
        }
        .onChange(of: rightAmount) { oldValue, newValue in
            if rightTyping {
                leftAmount = rightCurrency.convert(convertedAmount: rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: rightCurrency) { oldValue, newValue in
            rightAmount = leftCurrency.convert(convertedAmount: leftAmount, to: rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
