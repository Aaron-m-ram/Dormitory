//
//  GenMainx.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct GenMainx: View {
    
    let columns = [GridItem(.fixed(150)),
                   GridItem(.fixed(150))]
    
    private let bldgArr =  ["General", "Electrical", "Key and lock", "Plumbing"]
    private let imageArr = ["hammer", "powerplug", "key", "drop"]
     
    @ViewBuilder
//    func SquareView() -> some View {
//        .overlay(
//            RoundedRectangle(cornerRadius: 5)
//            .stroke())
//    }
    
    var body: some View {
        ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach((0...3), id: \.self) { index in
                        NavigationLink(destination: RoomNumber()){
                        VStack{
                        Image(systemName: imageArr[index])
                                .resizable()
                                .frame(width: 50, height: 55)
                        Text(bldgArr[index])
                                .font(.subheadline)
                        }
                            .frame(width: 100, height: 100)
                            //.padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                            .stroke())
                        }
                            .padding(.init(25))
                    
                    }
                }
        }
        .navigationBarTitle("The issue", displayMode: .inline)
        .padding(.top, 50.0)
    }
}

struct GenMainx_Previews: PreviewProvider {
    static var previews: some View {
        GenMainx()
    }
}
