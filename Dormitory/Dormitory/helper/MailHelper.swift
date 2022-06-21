//
//  MailHelper.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/18/22.
//

import SwiftUI
import UIKit
import MessageUI

struct MailView: UIViewControllerRepresentable {
    
    @EnvironmentObject var mainxInfo: MainxInfo

    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    @State var complete = false;
    //@State var mainViewActive = false

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        @Binding var complete: Bool
        //var mainxInfo: MainxInfo
        //@State var mainViewActive = false

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>,
             complete: Binding<Bool>/*,
             mainxInfo: <MainxInfo>*/) {
            _presentation = presentation
            _result = result
            _complete = complete
            //_mainxInfo = mainxInfo
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
           
            
            defer {
                $presentation.wrappedValue.dismiss()
                print("does it work here too?")
                
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            
            switch result.rawValue {
            case MFMailComposeResult.cancelled.rawValue:
                print("Mail cancelled")
            case MFMailComposeResult.saved.rawValue:
                print("Mail saved")
            case MFMailComposeResult.sent.rawValue:
                print("Mail sent")
                print("complete before:\(complete) ")
                complete = true
                print("complete after: \(complete)")
                if(complete == true){
                    //mainxInfo.description = "We changed it!!!!"
                }

                //return //mainxInfo.description = "We changed it!!!!!"
            case MFMailComposeResult.failed.rawValue:
                print("Mail sent failure: %@", [error!.localizedDescription])
            default:
                break
            }
            //controller.dismissViewControllerAnimated(true, completion: nil)
            

            
            //NavigationLink(destination: Home(), isActive: $mainViewActive)
            //let _ = print("made it successful result: \(self.result)")
        }
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result, complete: $complete/*, mainxInfo: mainxInfo*/)

    }
//    func navView() -> some View{
//        @State var isShowingView = true
//        return NavigationLink(destination: Home(), isActive: $isShowingView){
//            Home()
//        }
//    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        defer{
            //navView()
            mainxInfo.description = ""
            mainxInfo.room = ""
            print("mainxInfo: \(mainxInfo)")
            //navView()
        }
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        //vc.setToRecipients(["CES@CES.CES"])
        vc.setToRecipients(["iupamxhfdyindxcnzw@kvhrr.com"])
        vc.setSubject("Work Order")
        vc.setMessageBody("<h1> WorK Order </h1>hello myv room is \(mainxInfo.room) and the issues I am having are: \(mainxInfo.description) ", isHTML: true)
        
        return vc
    }
        //.EnvironmentObject(MainxInfo())

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        //print("updateUIViewController is in da houzzzezeeee")
    }
}
