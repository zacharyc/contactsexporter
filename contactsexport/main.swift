//
//  main.swift
//  contactsexport
//
//  Created by Zachary Cohen on 12/23/22.
//

import Foundation
import AddressBook
import Contacts

print("Hello, welcome to the AddressBook Scraper")


//func runExport(store : CNContactStore) -> [CNContact] {
//    let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey]
//    let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
//    var contacts = [CNContact]()
//
//    fetchRequest.mutableObjects = false
//    fetchRequest.unifyResults = true
////    fetchRequest.sortOrder = .UserDefault
//
//    do {
//        try CNContactStore().enumerateContactsWithFetchRequest(fetchRequest) { (contact, stop) -> Void in
//            contacts.append(contact)
//        }
//    } catch let e as NSError {
//        print(e.localizedDescription)
//    }
//
//    return contacts
//}

var store = CNContactStore()

store.requestAccess(for: .contacts, completionHandler: { (access, accessError) -> Void in
    if access {
        print("access granted")
        print(access)
    }
    else {
        print("access denied")
    }
})

//let foo = try store.unifiedMeContactWithKeys(toFetch: [CNContactFamilyNameKey])
//let cs = try store.unifiedContacts(matching: NSPredicate(value: true), keysToFetch: [CNContactFamilyNameKey])
//let contacts = try store.unifiedContactsMatchingPredicate(NSPredicate(value: true), keysToFetch:[CNContactGivenNameKey, CNContactFamilyNameKey])

//print(cs);

//func findContactsOnBackgroundThread ( completionHandler:@escaping (_ contacts:[CNContact]?)->()) {
//
//    DispatchQueue.global(qos: .userInitiated).async(execute: { () -> Void in
//
//        let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),CNContactPhoneNumbersKey] as [Any] //CNContactIdentifierKey
//        let fetchRequest = CNContactFetchRequest( keysToFetch: keysToFetch as! [CNKeyDescriptor])
//        var contacts = [CNContact]()
//        CNContact.localizedString(forKey: CNLabelPhoneNumberiPhone)
//
//        if #available(iOS 10.0, *) {
//            fetchRequest.mutableObjects = false
//        } else {
//            // Fallback on earlier versions
//        }
//        fetchRequest.unifyResults = true
//        fetchRequest.sortOrder = .userDefault
//
//        let contactStoreID = CNContactStore().defaultContainerIdentifier()
//        print("\(contactStoreID)")
//
//
//        do {
//
//            try CNContactStore().enumerateContacts(with: fetchRequest) { (contact, stop) -> Void in
//                //do something with contact
//                if contact.phoneNumbers.count > 0 {
//                    contacts.append(contact)
//                }
//
//            }
//        } catch let e as NSError {
//            print(e.localizedDescription)
//        }
//
//        DispatchQueue.main.async(execute: { () -> Void in
//            completionHandler(contacts)
//
//        })
//    })
//}
//
//findContactsOnBackgroundThread { (contacts) in
//    print("called")
//    print(contacts?.count)
//}
//

let nameKeys = [
    CNContactNamePrefixKey,
    CNContactGivenNameKey,
    CNContactMiddleNameKey,
    CNContactFamilyNameKey,
    CNContactNameSuffixKey,
    ] as [CNKeyDescriptor]

do {
    let contactStore = CNContactStore()
    let me = try contactStore.unifiedMeContactWithKeys(toFetch: nameKeys)
//    let everyone = try contactStore.unifiedContacts(matching: NSPredicate(value: true), keysToFetch: nameKeys)
} catch let error {
    print("Failed to retreive Me contact: \(error)")
}

do {
    let contactStore = CNContactStore()
    let fetchRequest = CNContactFetchRequest(keysToFetch: nameKeys)
    try contactStore.enumerateContacts(with: fetchRequest) { con, response in
        print(con);
    }
} catch let error {
    print("Failed to retreive Me contact: \(error)")
}
