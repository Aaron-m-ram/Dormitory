//
//  services.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct Services: View {
    var body: some View {
        VStack{
            Text("Which service owns the dorm...")
                .font(.title)
                .bold()
                .frame(width: 375.0, alignment: .topLeading)
            
            VStack{
                Image(systemName: "ferry")
                    .resizable()
                    .frame(width: 75, height: 75)
                    //.padding()
                Text("Navy")
                    .font(.title)
            }
            .frame(width: 350, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black))
            .padding(.bottom)
            
            VStack{
                Image(systemName: "airplane.departure")
                        .resizable()
                        .frame(width: 75, height: 75)
                        //.padding()
                    Text("Air Force")
                        .font(.title)
                }
                .frame(width: 350, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black))
                .padding(.bottom)
        }
    }
}

struct services_Previews: PreviewProvider {
    static var previews: some View {
        Services()
    }
}
