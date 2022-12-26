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


let nameKeys = [
    CNContactNamePrefixKey,
    CNContactGivenNameKey,
    CNContactMiddleNameKey,
    CNContactFamilyNameKey,
    CNContactNameSuffixKey,
    ] as [CNKeyDescriptor]

let allContactKeys = [
    CNContactNamePrefixKey,
    CNContactGivenNameKey,
    CNContactMiddleNameKey,
    CNContactFamilyNameKey,
    CNContactNameSuffixKey,
    CNContactOrganizationNameKey,
    CNContactDepartmentNameKey,
    CNContactJobTitleKey,
    CNContactBirthdayKey,
    CNContactNicknameKey,
    CNContactNoteKey,
    CNContactNonGregorianBirthdayKey,
    CNContactPreviousFamilyNameKey,
    CNContactPhoneticGivenNameKey,
    CNContactPhoneticMiddleNameKey,
    CNContactPhoneticFamilyNameKey,
    CNContactImageDataKey,
    CNContactThumbnailImageDataKey,
    CNContactImageDataAvailableKey,
    CNContactTypeKey,
    CNContactPhoneNumbersKey,
    CNContactEmailAddressesKey,
    CNContactPostalAddressesKey,
    CNContactDatesKey,
    CNContactUrlAddressesKey,
    CNContactRelationsKey,
    CNContactSocialProfilesKey,
    CNContactInstantMessageAddressesKey,
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
    let fetchRequest = CNContactFetchRequest(keysToFetch: allContactKeys)
    try contactStore.enumerateContacts(with: fetchRequest) { con, response in
        print(con);
    }
} catch let error {
    print("Failed to retreive Me contact: \(error)")
}
