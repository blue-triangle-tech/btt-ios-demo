//
//  UnitTestsView.swift
//
//  Created by Ashok Singh on 01/09/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import SwiftUI

struct UnitTestsView: View {
    
    @State var isMemoryTestsActive : Bool = false
    @State var isCPUTestsActive : Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            List {
                HStack{
                    Text("Memory Test")
                    Spacer()
                }
                .onTapGesture {
                    self.isMemoryTestsActive = true
                }
                
                HStack{
                    Text("CPU Test")
                    Spacer()
                }
                .onTapGesture {
                    self.isCPUTestsActive = true
                }
            }
            Spacer()
        }
        .navigationTitle("Unit Tests")
        .navigationDestination(isPresented: self.$isMemoryTestsActive, destination: {
            MemoryTestView(viewModel: UnitTestsViewModel())
        })
        .navigationDestination(isPresented: self.$isCPUTestsActive, destination: {
            CPUTestView(viewModel: UnitTestsViewModel())
        })
        
    }
}

struct UnitTestsView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestsView()
    }
}
