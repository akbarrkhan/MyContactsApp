//
//  ContactDetailView.swift
//  MyContactsApp
//
//  Created by Mac on 07/03/2023.
//

import SwiftUI

struct ContactDetailView: View {
    
    let contact: Contact
    
    var body: some View {
        
        List{
            Section("General"){
                LabeledContent{
                    Text(contact.name)
                } label: {
                    Text("Email")
                }
                LabeledContent{
                    Text(contact.phoneNumber)
                } label: {
                    Text("Phone Number Here")
                }
                LabeledContent{
                    Text(contact.dob, style: .date)
                } label: {
                    Text("Birthday")
                }
                
            }
            
            Section("Notes"){
                Text(contact.notes)
            }
        }.navigationTitle(contact.formattingName)
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactDetailView(contact: .previews())
        }
    }
}
