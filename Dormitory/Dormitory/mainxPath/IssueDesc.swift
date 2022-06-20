//
//  IssueDesc.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/18/22.
//

import SwiftUI
import MessageUI

struct IssueDesc: View {
    
    @State private var issue: String = ""
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        VStack() {

            TextField("Describe the issues you are having", text: $issue)
                .font(.title2)
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
            }

            .overlay(
                RoundedRectangle(cornerRadius: 5)
            .stroke())
            .padding()
        }
        .navigationBarTitle("Issue Description", displayMode: .inline)


    }
}

struct IssueDesc_Previews: PreviewProvider {
    static var previews: some View {
        IssueDesc()
    }
}
