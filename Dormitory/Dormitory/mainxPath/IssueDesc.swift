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
    
    enum FocusField: Hashable {
      case field
    }
    @FocusState private var focusedField: FocusField?
    
    //Testing code//
    @State var complete = true
    //Testing code//
    
    
    var body: some View {
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

                }
            Spacer()
            Button(action: {
                self.isShowingMailView.toggle()
            }){
                Text("Submit")
                    .font(.title)
                    .frame(width: UIScreen.main.bounds.size.width-10, height: 50)
                    //.padding(bottom)
            }
            .disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMailView){
                MailView(result: self.$result)
                let _ = print("result is: :)))))))))))")
                let _ = print("\(MailView(result: self.$result).complete)")
//                defer{
//                    mainxInfo.description = "we changed it"
//                }
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
            .stroke())
            .padding()
//            if(complete == true){
//                mainxInfo.description = "we changed it in IssueDesc"
//            }
            
        }
        

        .environmentObject(mainxInfo)
        .navigationBarTitle("Describe The Issue", displayMode: .inline)
        



    }
}



struct IssueDesc_Previews: PreviewProvider {
    static var previews: some View {
        IssueDesc()
            .environmentObject(MainxInfo())
    }
}
