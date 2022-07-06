//
//  HelpPOC.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 7/5/22.
//

import SwiftUI

struct HelpPOC: View {
    
    @EnvironmentObject var mainxInfo: MainxInfo
    
    private let managerArr = ["123-123-123", "123-123-123", "123-123-123", "123-123-123", "123-123-123", "123-123-123"]
    private let eMainxArr = ["456-456-456", "456-456-456", "456-456-456", "456-456-456", "456-456-456", "456-456-456"]
    private let dormLead = ["789-789-789", "789-789-789", "789-789-789", "789-789-789", "789-789-789", "789-789-789"]
    
    var body: some View {
        List {
            Text("Manager: \n \(managerArr[mainxInfo.dormIndex])")
            Text("Emergency Maintenance: \n \(eMainxArr[mainxInfo.dormIndex])")
            Text("Dorm Lead: \n \(dormLead[mainxInfo.dormIndex])")
           
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
