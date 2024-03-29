//
//  AirForceDorm.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct AirForceDorms: View {
    
    let columns = [GridItem(.fixed(150)),
                   GridItem(.fixed(150))]
    
    private let bldgArr =  ["AF1", "AF2", "AF3", "AF4", "AF5", "AF6"]
    
    @Binding var takeMeHome2: Bool
    @EnvironmentObject var mainxInfo: MainxInfo
     
    @ViewBuilder
    var destinationView: some View {
        if mainxInfo.choices == 0 {
            GenMainx(takeMeHome3: self.$takeMeHome2)
        } else {
            HelpPOC()
        }
    }
    var body: some View {
        ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach((0...5), id: \.self) { index in
                        NavigationLink(destination: destinationView
                            .onAppear{
                            let _ = print("you are in the AF Dorm")
                            mainxInfo.dormName = bldgArr[index]
                            mainxInfo.dormIndex = index
                                let _ = print("your choice is: \(mainxInfo.choices)")
                        }){
                        Text(bldgArr[index])
                            .frame(width: 75, height: 75)
                            .padding()
                        //}
                            .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                        }
                            .isDetailLink(false)
                            .padding(.init(25))
                    
                    }
                    
                }
        }
        .navigationBarTitle("Which building?", displayMode: .inline)
        .padding(.top, 50.0)
        .environmentObject(mainxInfo)
    }
}

struct AirForceDorms_Previews: PreviewProvider {
    static var previews: some View {
        //AirForceDorms()
        Group {
            AirForceDorms(takeMeHome2: .constant(true))
            AirForceDorms(takeMeHome2: .constant(false))
         }
        .environmentObject(MainxInfo())
    }
}
