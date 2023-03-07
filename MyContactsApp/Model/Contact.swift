//
//  Contact.swift
//  MyContactsApp
//
//  Created by Mac on 06/03/2023.
//

import Foundation
import CoreData

final class Contact: NSManagedObject, Identifiable {
    
    @NSManaged var dob: Date
    @NSManaged var name: String
    @NSManaged var notes: String
    @NSManaged var phoneNumber: String
    @NSManaged var email: String
    @NSManaged var isFavourite: Bool
    
    var isBirthday: Bool {
        Calendar.current.isDateInToday(dob)
    }
    
    
    
    var formattingName: String {
        "\(isBirthday ? "🎈" : "")\(name)"
    }
    
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "dob")
        setPrimitiveValue(false, forKey: "isFavourite")
    }
}


extension Contact {
    
    private static var contactsFetchRequest: NSFetchRequest<Contact>{
        NSFetchRequest(entityName: "Contact")
    }
    
    static func all() -> NSFetchRequest<Contact> {
        let request: NSFetchRequest<Contact> = contactsFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Contact.name, ascending: true)
        ]
        return request
    }
    
}


extension Contact {
    
    @discardableResult
    static func makePreview(count: Int, in context: NSManagedObjectContext) -> [Contact] {
        
        var contacts = [Contact]()
        for i in 0..<count {
            let contact = Contact(context: context)
            contact.name = "item \(i)"
            contact.email = "test_\(i)@gmail.com"
            contact.isFavourite = Bool.random()
            contact.phoneNumber = "0092312774666\(i)"
            contact.dob = Calendar.current.date(byAdding: .day,
                                                value: -i,
                                                to: .now) ?? .now
            
            contact.notes = "This is a preview for item \(i)"
            contacts.append(contact)
            
        }
        return contacts
    }
    
    static func previews(context: NSManagedObjectContext = ContactsProvider.shared.viewContext) -> Contact {
        return makePreview(count: 1, in: context)[0]
    }
    
    static func empty(context: NSManagedObjectContext = ContactsProvider.shared.viewContext) -> Contact {
        return Contact(context: context)
    }
}
