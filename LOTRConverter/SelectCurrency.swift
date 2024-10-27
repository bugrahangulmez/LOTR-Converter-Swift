import SwiftUI

struct SelectCurrency: View {
    @Binding var upCurrency: Currency
    @Binding var downCurrency: Currency
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Select the currency you are starting with: ")
                    .fontWeight(.bold)
                IconGrid(currency: $upCurrency)
                
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                IconGrid(currency: $downCurrency)
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Done")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.brown)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .background(.brown)
    }
}

#Preview {
    SelectCurrency(upCurrency: .constant(.copperPenny), downCurrency: .constant(.goldPenny))
}
