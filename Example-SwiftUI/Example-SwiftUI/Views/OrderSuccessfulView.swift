//
//  OrderSuccessfulView.swift
//
//  Created by admin on 30/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import SwiftUI
import BlueTriangle
struct OrderSuccessfulView: View {
    var checkoutId: String!
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Thanks for ordering")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 22, weight: .bold))
                Text("Chekout Id: ")
                Text(checkoutId)
                Button(
                    action: {
                        ANRTest.heavyLoop()
                        presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Text("Continue Shopping")
                    })
                .buttonStyle(.primary())
            }
            .foregroundColor(.secondary)
            .padding(.horizontal)
            .navigationTitle("Checkout")
            .bttTrackScreen("OrderSuccessfulView")
        }
    }
}

struct OrderSuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSuccessfulView(checkoutId: "")
    }
}
