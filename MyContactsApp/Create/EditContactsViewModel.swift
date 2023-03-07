//
//  EditContactsViewModel.swift
//  MyContactsApp
//
//  Created by Mac on 07/03/2023.
//

import Foundation
import CoreData


final class EditContactViewModel: ObservableObject {
    
    @Published var contact: Contact
    
    private let context: NSManagedObjectContext
    
    init(provider: ContactsProvider, contact: Contact? = nil){
        self.context = provider.newContext
        self.contact = Contact(context: self.context)
    }
    
    
    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
    
}
