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
     
    @ViewBuilder
//    func SquareView() -> some View {
//        .overlay(
//            RoundedRectangle(cornerRadius: 5)
//            .stroke())
//    }
    
    var body: some View {
        ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach((0...5), id: \.self) { index in
                        NavigationLink(destination:GenMainx()){
                        Text(bldgArr[index])
                            .frame(width: 75, height: 75)
                            .padding()
                        //}
                            .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                        }
                            .padding(.init(25))
                    
                    }
                }
        }
        .navigationBarTitle("Which building?", displayMode: .inline)
        .padding(.top, 50.0)
    }
}

struct AirForceDorms_Previews: PreviewProvider {
    static var previews: some View {
        AirForceDorms()
    }
}
