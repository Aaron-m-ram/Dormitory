//
//  Home.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            Text("JBPHH Dorms")
                .font(.title)
                .bold()
            VStack{
                Image(systemName: "wrench.and.screwdriver")
                    .resizable()
                    .frame(width: 75, height: 75)
                    //.padding()
                Text("Maintenance")
                    .font(.title)
                Text("report a leaky faucet, broken locks, etc.")
                    .font(.subheadline)
            }
            .frame(width: 350, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black))
            .padding(.bottom)
            
                VStack{
                    Image(systemName: "hand.wave")
                        .resizable()
                        .frame(width: 75, height: 75)
                        //.padding()
                    Text("Help")
                        .font(.title)
                    Text("Locked out or need helped after hours")
                        .font(.subheadline)
                }
                .frame(width: 350, height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black))
                .padding(.bottom)
                
            VStack{
                Image(systemName: "exclamationmark.3")
                    .resizable()
                    .frame(width: 75, height: 75)
                    //.padding()
                Text("Help")
                    .font(.title)
                Text("Locked out or need helped after hours")
                    .font(.subheadline)
            }
            .frame(width: 350, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black))
            .padding(.bottom)
            
        }
        

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
