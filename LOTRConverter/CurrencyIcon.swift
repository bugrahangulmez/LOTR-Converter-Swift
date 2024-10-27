//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Bugrahan on 25.10.2024.
//

import SwiftUI

struct CurrencyIcon: View {
    let image: ImageResource
    let text: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(image)
                .resizable()
                .scaledToFit()
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .frame(maxWidth:.infinity)
                .padding(5)
                .background(.brown.opacity(0.5))
                
        }
        .padding(EdgeInsets(top:3,leading: 3,bottom: 0,trailing: 3))
        .background(.brown)
        .clipShape(.rect(cornerRadius: 10))
        .frame(width:100,height:100)
    }
}

#Preview {
    CurrencyIcon(image: .copperpenny, text: "Copper Penny")
}
