//
//  services.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct Services: View {
    
//    class MainxInfo: ObservableObject {
//        @Published var roomNumIssue = ""
//        @Published var description = ""
//    }
    
    //@EnvironmentObject var roomNumIssue: String
    //@Published var roomNumIssue: String
    @Binding var takeMeHome: Bool
    @EnvironmentObject var mainxInfo: MainxInfo
    
    
    
    
    var body: some View {
            VStack(spacing: 30){
                NavigationLink(destination: NavyDorms(takeMeHome2: self.$takeMeHome)
                    .onAppear{
                    let _ = print("you are in the navy service")
                    let _ = print("your choice number is: \(mainxInfo.choices)")
                    mainxInfo.service = "navy"
                }){
                    VStack{
                        Image(systemName: "ferry")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Text("navy")
                            .font(.title)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                        .stroke())
                }
                .isDetailLink(false)
                
                NavigationLink(destination: AirForceDorms(takeMeHome2: self.$takeMeHome)
                    .onAppear{
                    let _ = print("you are in the Air Force service")
                    mainxInfo.service = "Air Force"
                    let _ = print("your choice number is: \(mainxInfo.choices)")
                }){
                    VStack{
                        Image(systemName: "airplane.departure")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Text("Air Force")
                            .font(.title)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                        .stroke())
                    
                }
                .isDetailLink(false)
            }
            .navigationBarTitle("Who owns the dorm?", displayMode: .inline)
            .environmentObject(mainxInfo)
            //.navigationBarBackButtonHidden(true)
    }
}

struct services_Previews: PreviewProvider {
    static var previews: some View {
        //Services()
        Group {
            AirForceDorms(takeMeHome2: .constant(true))
            AirForceDorms(takeMeHome2: .constant(false))
        }.environmentObject(MainxInfo())
    }
}
