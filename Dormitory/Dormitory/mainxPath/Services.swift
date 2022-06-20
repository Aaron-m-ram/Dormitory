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
    
    
    
    
    var body: some View {
            VStack(spacing: 30){
                NavigationLink(destination: NavyDorms()){
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
                
                NavigationLink(destination: AirForceDorms()){
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
            }
            .navigationBarTitle("Who owns the dorm?", displayMode: .inline)
            //.navigationBarBackButtonHidden(true)
    }
}

struct services_Previews: PreviewProvider {
    static var previews: some View {
        Services()
    }
}
