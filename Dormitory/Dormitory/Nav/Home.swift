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
            Image(systemName: "wrench.and.screwdriver")
                .resizable()
                .frame(width: 75, height: 75)
                .padding()
            Text("Maintenance")
                .font(.title)
            Text("report a leaky faucet, broken locks, etc.")
                .font(.subheadline)
                .padding(.bottom)
            
        }
        .frame(width: 350, height: 250)
        .border(.pink, width: 5)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
