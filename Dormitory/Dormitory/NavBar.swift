//
//  NavBar.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct NavBar: View {
   @State var originalHome: Bool = false
    
    @State private var selection = 0
    @State private var resetNavigationID = UUID()
    
    var body: some View{
        
        let selectable = Binding(
            get: { self.selection },
            set: { self.selection = $0
                self.resetNavigationID = UUID()
                self.originalHome = false
            })
        
        return TabView(selection: selectable) {
            self.tab1()
                .tabItem(){
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            self.tab2()
                .tabItem(){
                    Image(systemName: "phone.fill")
                    Text("Contacts")
                }.tag(1)
            
            self.tab3()
                .tabItem(){
                    Image(systemName: "shippingbox.fill")
                    Text("Moving Out")
                }
            
            self.tab4()
                .tabItem(){
                    Image(systemName: "ellipsis")
                    Text("More")
                }
            
        }
        
    }
    
    private func tab1() -> some View {
        NavigationView{
            VStack(spacing: 30){
                NavigationLink(destination: Services(takeMeHome: self.$originalHome), isActive: self.$originalHome) {
                    VStack{
                        Image(systemName: "wrench.and.screwdriver")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Text("maintenance")
                            .font(.title)
                        Text("report a leaky faucet, broken locks, etc...")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                }
                
                NavigationLink(destination: Services(takeMeHome: self.$originalHome), isActive: self.$originalHome) {
                    VStack{
                        Image(systemName: "hand.wave")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Text("Help")
                            .font(.title)
                        Text("Locked out or need helped after hours")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                }
                
                NavigationLink(destination: Emer()){
                    VStack{
                        Image(systemName: "exclamationmark.3")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Text("Emergency")
                            .font(.title)
                        Text("maintenance emergence/contact management")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                }
                    
            }
            .navigationTitle("Dormitory")
            .navigationBarBackButtonHidden(true)
        }
        .id(self.resetNavigationID)
    }
    
    
    private func tab2() -> some View {
        NavigationView{
            VStack(spacing: 30){
                NavigationLink(destination: Crisis()){
                    VStack{
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
        }.id(self.resetNavigationID)
    }
    
    private func tab3() -> some View {
        Text("Hello from moving :)")
            .id(self.resetNavigationID)
    }
    
    private func tab4() -> some View {
        Text("Hello from More :D")
            .id(self.resetNavigationID)
    }
}


//struct NavBar: View {
//    var body: some View {
//
//        TabView {
//            Home()
//                .tabItem(){
//                    Image(systemName: "house")
//                    Text("Home")
//                }
//
//            PhoneBook()
//                .tabItem(){
//                    Image(systemName: "phone.fill")
//                    Text("Contacts")
//                }
//            MovingOnUp()
//                .tabItem(){
//                    Image(systemName: "shippingbox.fill")
//                    Text("Moving Out")
//                }
//            More()
//                .tabItem(){
//                    Image(systemName: "ellipsis")
//                    Text("More")
//                }
//        }
//        //.frame(height: 200)
//    }
//
//}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
