//
//  HelpPOC.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 7/5/22.
//

import SwiftUI

struct HelpPOC: View {
    
    @EnvironmentObject var mainxInfo: MainxInfo
    
    private let managerArr = ["223-123-1234", "223-123-1234", "223-123-1234", "223-123-1234", "223-123-123", "223-123-123"]
    private let mainxArr = ["456-456-4567", "456-456-4567", "456-456-4567", "456-456-4567", "456-456-4567", "456-456-4567"]
    private let dormLead = ["789-789-7890", "789-789-7890", "789-789-7890", "789-789-7890", "789-789-7890", "789-789-7890"]
    

//    Going to have to repeat it, one for navy side, one for air force side
//    sudo code will be if mainxinfo.service == navy do navy stuff else do air force stuff
//    private let managerArr = ["223-123-1234", "223-123-1234", "223-123-1234", "223-123-1234", "223-123-123", "223-123-123"]
//    private let mainxArr = ["456-456-4567", "456-456-4567", "456-456-4567", "456-456-4567", "456-456-4567", "456-456-4567"]
//    private let dormLead = ["789-789-7890", "789-789-7890", "789-789-7890", "789-789-7890", "789-789-7890", "789-789-7890"]
    
    var body: some View {
        List {
            Link("Manager: \n \(managerArr[mainxInfo.dormIndex])", destination: URL(string: "tel:\(managerArr[mainxInfo.dormIndex])")!)
            Link("Maintenance: \n \(mainxArr[mainxInfo.dormIndex])", destination: URL(string: "tel:\(mainxArr[mainxInfo.dormIndex])")!)
            
            Link("Dorm Lead: \n \(dormLead[mainxInfo.dormIndex])", destination: URL(string: "tel:\(dormLead[mainxInfo.dormIndex])")!)
            //Text("Dorm Lead: \n \(dormLead[mainxInfo.dormIndex])")
           
        }
        .navigationTitle("Help Point of Contacts")
        .environmentObject(mainxInfo)
    }
}

struct HelpPOC_Previews: PreviewProvider {
    static var previews: some View {
        HelpPOC()
            .environmentObject(MainxInfo())
    }
}
