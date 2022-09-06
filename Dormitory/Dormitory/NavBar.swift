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
    
    @EnvironmentObject var mainxInfo: MainxInfo
    //@StateObject var mainxInfo = MainxInfo()
    
    var body: some View{
        
        let selectable = Binding(
            get: { self.selection },
            set: { self.selection = $0
                self.resetNavigationID = UUID()
                self.originalHome = false
                
                mainxInfo.service = ""
                mainxInfo.dormName = ""
                mainxInfo.genProblem = ""
                mainxInfo.room = ""
                mainxInfo.description = ""
                mainxInfo.dormIndex = 0
                mainxInfo.choices = 0
            })
        
        return TabView(selection: selectable) {
            self.tab1()
                .tabItem(){
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
                //.environmentObject(mainxInfo)
            
            self.tab2()
                .tabItem(){
                    Image(systemName: "phone.fill")
                    Text("Contacts")
                }.tag(1)
            
            self.tab3()
                .tabItem(){
                    Image(systemName: "shippingbox.fill")
                    Text("Moving Out")
                }.tag(2)
            
            self.tab4()
                .tabItem(){
                    Image(systemName: "ellipsis")
                    Text("More")
                }.tag(3)
            
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
                .isDetailLink(false)
                
                NavigationLink(destination: Services(takeMeHome: self.$originalHome)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                            mainxInfo.choices = 2
                        }
                    })
                /*isActive: self.$originalHome)*/{
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
                .isDetailLink(false)
                
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
                //.isDetailLink(false)
                    
            }
            .navigationTitle("Dormitory")
            .navigationBarBackButtonHidden(true)
        }
        .id(self.resetNavigationID)
        .environmentObject(mainxInfo)
    }
    
    
    private func tab2() -> some View {
        NavigationView{
            
            VStack(spacing: 30){
                NavigationLink(destination: Crisis()){
                    VStack{
                        Text("SHIRT/Umbudsmen")
                            .font(.title)
                        Text("If you need to contact your SHIRT/Umbudsmen")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                }
            
            
                NavigationLink(destination: Crisis()){
                    VStack{
                        Text("Dorm Management")
                            .font(.title)
                        Text("If you need help for any situation")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                }
            
                NavigationLink(destination: Crisis()){
                    VStack{
                        Text("Resources")
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
        NavigationView{
            VStack(spacing: 30){
                NavigationLink(destination: Crisis()){
                    VStack{
                        Text("Off Base Housing")
                            .font(.title)
                        Text("If you want to enjoy all that Hawaii has to give")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                }
            
            
                NavigationLink(destination: Crisis()){
                    VStack{
                        Text("On Base Housing")
                            .font(.title)
                        Text("If you want the comfort of living on the base's amazing communities")
                            .font(.subheadline)
                    }
                    .frame(width: 350, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke())
                }
            
                NavigationLink(destination: Crisis()){
                    VStack{
                        Text("BAH Calculator")
                            .font(.title)
                        Text("Get to know how much money you will get to live in Hawaii")
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
    
    private func tab4() -> some View {
        NavigationView{
            List {
                Link("Facebook", destination: URL(string: "https://www.facebook.com/JBPHH")!)
                Link("Instagram", destination: URL(string: "https://instagram.com/jointbasephh")!)
                Link("Great Life Hawaii", destination: URL(string: "https://jbphh.greatlifehawaii.com")!)
               
            }
            .navigationTitle("More")
                //.navigationTitle("Landmarks")

        }//.id(self.resetNavigationID)
        //.navigationTitle("More")
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
            .environmentObject(MainxInfo())
    }
}
