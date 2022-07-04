//
//  Crisis.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 7/3/22.
//

import SwiftUI

struct Crisis: View {
    let columns = [GridItem(.fixed(150)),
                   GridItem(.fixed(150))]
    
    private let bldgArr =  ["SAPR", "Suicide Prevention", "AADD", "Chaplain"]
   // private let imageArr = ["hammer", "powerplug", "key", "drop"]
    
    //@Binding var takeMeHome3: Bool
     
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
                        NavigationLink(destination: CrisisContact()){
                        VStack{
                        //Image(systemName: imageArr[index])
                                //.resizable()
                                //.frame(width: 50, height: 55)
                        Text(bldgArr[index])
                                .font(.subheadline)
                        }
                            .frame(width: 100, height: 100)
                            //.padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                            .stroke())
                        }
                            .isDetailLink(false)
                            .padding(.init(25))
                    
                    }
                }
        }
        .navigationBarTitle("The issue", displayMode: .inline)
        .padding(.top, 50.0)
    }
}

struct Crisis_Previews: PreviewProvider {
    static var previews: some View {
        Crisis()
    }
}
