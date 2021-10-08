//
//  TimerRequestView.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 10/7/21.
//

import SwiftUI

struct TimerRequestView: View {
    @Environment(\.presentationMode) var presentationMode
    var timerFields: [String: String]
    var requestRepresentation: String {
        timerFields.reduce( "{", { $0 + "\n  \"\($1.key)\": \"\($1.value)\"," }) + "\n}"
    }

    var body: some View {
        NavigationView {
            ScrollView {
                Text(requestRepresentation)
                    .font(.system(.body, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .padding(.all, 8)
            }
            .onTapGesture {
                self.presentationMode.wrappedValue.dismiss()
            }
            .navigationBarTitle("Request Body")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TimerRequestView_Previews: PreviewProvider {
    static var previews: some View {
        TimerRequestView(timerFields: PreviewData.timerFields)
    }
}
