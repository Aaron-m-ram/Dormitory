//
//  Issues.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct RoomNumber: View {
   
    @State private var roomNum: String = ""
    
    var body: some View {
        VStack() {
            //Text("Enter a Room Number")
            //    .font(.title)
            TextField("Enter your room number", text: $roomNum)
                .font(.title2)
                //.focused($keyboardFocused)

            //Text("Room Number: \(roomNum)")
            Spacer()
            NavigationLink(destination: IssueDesc()){
                Text("Next")
                    .font(.title)
                    .frame(width: UIScreen.main.bounds.size.width-10, height: 50)
                    //.padding(bottom)
            }

            .overlay(
                RoundedRectangle(cornerRadius: 5)
            .stroke())
            .padding()
        }
        .navigationBarTitle("Room Number", displayMode: .inline)


    }
}

struct RoomNumber_Previews: PreviewProvider {
    static var previews: some View {
        RoomNumber()
    }
}
