//
//  PhoneBook.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct PhoneBook: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {

                NavigationLink(destination: Crisis()) {
                    //Text("Choose Heads")
                    VStack{
                        //Image(systemName: "wrench.and.screwdriver")
                          //  .resizable()
                          //  .frame(width: 75, height: 75)
                        Text("Crisis")
                            .font(.title)
                        Text("If you need help for any situation")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                    
                }
            }
        }
    }
}

struct PhoneBook_Previews: PreviewProvider {
    static var previews: some View {
        PhoneBook()
    }
}
