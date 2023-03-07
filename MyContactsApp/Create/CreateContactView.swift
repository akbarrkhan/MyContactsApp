//
//  CreateContactView.swift
//  MyContactsApp
//
//  Created by Mac on 07/03/2023.
//

import SwiftUI

struct CreateContactView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: EditContactViewModel
    
    var body: some View {
        List{
            Section("General"){
                TextField("Name", text: $vm.contact.name)
                    .keyboardType(.namePhonePad)
                
                TextField("Email", text: $vm.contact.email)
                    .keyboardType(.emailAddress)
                
                TextField("Phone Number", text: $vm.contact.phoneNumber)
                    .keyboardType(.numberPad)
                
                DatePicker("Birthday", selection: $vm.contact.dob,
                           displayedComponents: [.date])
                .datePickerStyle(.compact)
                
                Toggle("Favourite", isOn: $vm.contact.isFavourite)
            }
            
            Section("Notes"){
                TextField("", text: $vm.contact.notes,
                          axis: .vertical)
            }
        }.navigationTitle("Name Here")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Done"){
                        do {
                    
                            try vm.save()
                            
                        }catch {
                            print(error)
                        }
                        dismiss()

                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                
            }
        
    }
}

struct CreateContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = ContactsProvider.shared
            CreateContactView(vm: .init(provider: preview))
                .environment(\.managedObjectContext, preview.viewContext)
        }
    }
}