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
    
    @Binding var takeMeHome3: Bool
    @EnvironmentObject var mainxInfo: MainxInfo
    @State var transfer = ""
    
     
    @ViewBuilder
    
    var body: some View {
        
        
        ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach((0...3), id: \.self) { index in
                        NavigationLink(destination: RoomNumber(takeMeHome4: self.$takeMeHome3)
                            .onAppear{
                                let _ = print("you are selecting a general problem")
                                mainxInfo.genProblem = bldgArr[index]
                            }){
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
                            //.onTapGesture {
                                //$mainxInfo.genProblem = bldgArr[index]
                                //transfer = bldgArr[index]
                                //let _ = print("made it to onTapGesture")
                                //let _ = print(bldgArr[index])
                                //$mainxInfo.genProblem = transfer
                                //$mainxInfo.genProblemIndex = index
                            //}
                            
                        }

                            .isDetailLink(false)
                            .padding(.init(25))


                    
                    }

                }
        }
        .navigationBarTitle("The issue", displayMode: .inline)
        .padding(.top, 50.0)
        .environmentObject(mainxInfo)
    }
}

struct GenMainx_Previews: PreviewProvider {
    static var previews: some View {
        //GenMainx()
        Group {
            GenMainx(takeMeHome3: .constant(true))
            GenMainx(takeMeHome3: .constant(false))
         }
        .environmentObject(MainxInfo())
    }
}
