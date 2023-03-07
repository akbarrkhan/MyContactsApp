//
//  NoContactView.swift
//  MyContactsApp
//
//  Created by Mac on 07/03/2023.
//

import SwiftUI

struct NoContactsView: View {
    var body: some View {
        VStack{
            Text("👀 No Contacts")
                .font(.largeTitle.bold())
            Text("It's seems a lil empty here creare some contacts ☝️")
                .font(.callout)
        }

    }
}

struct NoContactView_Previews: PreviewProvider {
    static var previews: some View {
        NoContactsView()
    }
}
