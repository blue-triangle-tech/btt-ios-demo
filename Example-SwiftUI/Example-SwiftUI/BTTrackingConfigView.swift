//
//  BTTrackingConfigView.swift
//
//  Created by Ashok Singh on 27/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import SwiftUI

struct BTTrackingConfigView: View {
    
    @ObservedObject var vm: BTTConfigModel
   
    var body: some View {
        VStack{
            
            Spacer()
                .frame(height: 60)
            
            HStack{
                Spacer()
                Text("View Tracking Configuration")
                    .font(Font.system(size: 20, weight: .bold))
                Spacer()
            }
            
            Spacer()
                .frame(height: 200)
            
            HStack{
                Text("Site Id :")
                    .padding(.leading, 15)
                Spacer()
            }
            
            VStack {
                HStack{
                    TextField("Please enter SiteId", text: $vm.txtSiteId)
                        .frame(height: 40)
                        .foregroundColor(.black)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 40)
                        .foregroundColor(.white)
                        .padding(.leading, 0)
                        .padding(.trailing, 0)
                        .shadow(radius: 2)
                )
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }.frame(height: 40)
            
            
            Button(action: {
                vm.configure()
            }) {
                Text("Configure")
                    .foregroundColor(.blue)
                    .font(.system(size: 16.0, weight: .bold))
                
            }
            .padding(.top, 30)
            
            Spacer()
        }
    }
}

struct BTTrackingConfigView_Previews: PreviewProvider {
    static var previews: some View {
        BTTrackingConfigView(vm: BTTConfigModel())
    }
}
