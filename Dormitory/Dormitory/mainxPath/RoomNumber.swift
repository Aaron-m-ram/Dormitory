//
//  Issues.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct RoomNumber: View {
   
    //@State private var roomNum: String = ""
    //@State public var roomNum: Services.MainxInfo
    //@State private var roomNum: String = xInfo.room
    @EnvironmentObject var mainxInfo: MainxInfo
    let placeholderString = "Enter a room number"
    @Binding var takeMeHome4: Bool
    //@FocusState var isFocused: Bool
    
    enum FocusField: Hashable {
      case field
    }
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack() {
            //Text("Enter a Room Number")
            //    .font(.title)
            TextEditor(text: $mainxInfo.room)
                .font(.title2)
                .focused($focusedField, equals: .field)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                        self.focusedField = .field
                    }
                }
                //.frame(width: UIScreen.main.bounds.size.width - 5)
                //.textFieldStyle(.roundedBorder)
                //.fixedSize(horizontal: true, vertical: false)
            Spacer()
            NavigationLink(destination: IssueDesc(takeMeHome5: self.$takeMeHome4)){
                Text("Next")
                    .font(.title)
                    .frame(width: UIScreen.main.bounds.size.width-10, height: 50)
                    //.padding(bottom)
            }
            .isDetailLink(false)

            .overlay(
                RoundedRectangle(cornerRadius: 5)
            .stroke())
            .padding()
        }
        .environmentObject(mainxInfo)
        .navigationBarTitle("Give The Room Number", displayMode: .inline)


    }
}

struct RoomNumber_Previews: PreviewProvider {
    static var previews: some View {
        //RoomNumber()
        Group {
            RoomNumber(takeMeHome4: .constant(true))
            RoomNumber(takeMeHome4: .constant(false))
         }
            .environmentObject(MainxInfo())
    }
}
