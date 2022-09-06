//
//  Emer.swift
//  Dormitory
//
//  Created by Aaron Ramirez on 6/17/22.
//

import SwiftUI

struct Emer: View {
    @EnvironmentObject var mainxInfo: MainxInfo
    var body: some View {
        //Text("Emergency")
        
        List{
            //Text("911: 911")
            Link("911: \n911", destination: URL(string: "tel:911")!)
            Link("BDOC: \n808-474-6754", destination: URL(string: "tel:808-474=6754")!)
            //Link("BDOC", destination: URL(string: "tel: 808-474-6754")!)
            //Link("911", destination: URL(string: "tel: 911")!)
        }
        .navigationTitle("Emergency POC")
        .environmentObject(mainxInfo)
    }
}

struct Emer_Previews: PreviewProvider {
    static var previews: some View {
        Emer()
            .environmentObject(MainxInfo())
    }
}
