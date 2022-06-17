//
//  NavBar.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        
        TabView {
            Home()
                .tabItem(){
                    Image(systemName: "house")
                    Text("Home")
                }
            
            PhoneBook()
                .tabItem(){
                    Image(systemName: "phone.fill")
                    Text("Contacts")
                }
            MovingOnUp()
                .tabItem(){
                    Image(systemName: "shippingbox.fill")
                    Text("Moving Out")
                }
            More()
                .tabItem(){
                    Image(systemName: "ellipsis")
                    Text("More")
                }
        }
        //.frame(height: 200)
    }}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
