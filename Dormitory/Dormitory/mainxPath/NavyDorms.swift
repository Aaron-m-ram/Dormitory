//
//  NavyDorms.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct NavyDorms: View {
    
    let columns = [GridItem(.fixed(150)),
                   GridItem(.fixed(150))]
    
    private let bldgArr =  ["N1", "N2", "N3", "N4", "N5", "N6"]
     
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
                         
                        Text(bldgArr[index])
                            .frame(width: 75, height: 75)
                            .padding()
                            .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                            .padding(.init(25))
                    
                    }
                }
        }
        .padding(.top, 50.0)
    }
}

struct NavyDorms_Previews: PreviewProvider {
    static var previews: some View {
        NavyDorms()
    }
}
