//
//  IssueDesc.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/18/22.
//

import SwiftUI
import MessageUI

struct IssueDesc: View {
    
    //@State private var issue: String = ""
    @EnvironmentObject var mainxInfo: MainxInfo
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @Binding var takeMeHome5: Bool
    
    enum FocusField: Hashable {
      case field
    }
    @FocusState private var focusedField: FocusField?
    
    //Testing code//
    @State var complete = true
    
    
    //Testing code//
    
    
    var body: some View {
        //if(complete == true){
        VStack() {

            TextEditor(text: $mainxInfo.description)
                .font(.title2)
                .focused($focusedField, equals: .field)
                //.frame(width: UIScreen.main.bounds.size.width - 5)
                //.textFieldStyle(.roundedBorder)
                //.fixedSize(horizontal: true, vertical: false)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                        self.focusedField = .field
                    }
                    let _ = print("we made it print")
                    //let _ =

                }
            Spacer()
            Button(action: {
                self.isShowingMailView.toggle()
                self.takeMeHome5 = false
            }){
                Text("Submit")
                    .font(.title)
                    .frame(width: UIScreen.main.bounds.size.width-10, height: 50)
                    //.padding(bottom)
            }
            .disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMailView){
                MailView(result: self.$result)
                //complete = true
                let _ = print("result is: :)))))))))))")
                let _ = print("\(MailView(result: self.$result).complete)")

                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
            .stroke())
            .padding()
        }

        

        .environmentObject(mainxInfo)
        .navigationBarTitle("Describe The Issue", displayMode: .inline)
        //}
        //else{
        //HStack(){
            //if(complete == false){
//                NavigationLink(destination: Home(), isActive: $complete){
//                    Home()
                //}
                //.isDetailLink(false)
            //}
        //}
        //}



    }
}



struct IssueDesc_Previews: PreviewProvider {
    static var previews: some View {
        
        //IssueDesc(takeMeHome5: value)
        Group {
            IssueDesc(takeMeHome5: .constant(true))
            IssueDesc(takeMeHome5: .constant(false))
         }
            .environmentObject(MainxInfo())
    }
}
