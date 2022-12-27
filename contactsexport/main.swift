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

class LocalContactObject {
    var namePrefix : String?
    var givenName : String?
    var middleName: String?
    var familyName: String?
    var nameSuffix: String?
    var orgName: String?
    var departmentName: String?
    var jobTitle: String?
    var birthdayKey: String?
    var nicknameKey: String?
    var noteKey: String?
    var nonGregorianBirthday: String?
    var previousFamilyName: String?
    var phoneticGivenName: String?
    var phoneticMiddleName: String?
    var phoneticFamilyName: String?
    var imageData: String?
    var thumbnailImageData: String?
    var imageDataAvailable: String?
    var type: String?
    var phoneNumbers: String?
    var emailAddresses: String?
    var postalAddresses: String?
    var dates: String?
    var urlAddresses: String?
    var relations: String?
    var socialProfiles: String?
    var instantMessageAddresses: String?
    
    init(fromContact contact:CNContact) {
        self.namePrefix = contact.namePrefix
        self.givenName = contact.givenName
        self.middleName = contact.middleName
        self.familyName = contact.familyName
        self.nameSuffix = contact.nameSuffix
    }
    
    // The part above is trivial so that we can do some more complex things below
}

do {
    let contactStore = CNContactStore()
    let me = try contactStore.unifiedMeContactWithKeys(toFetch: nameKeys)
} catch let error {
    print("Failed to retreive Me contact: \(error)")
}

do {
    let contactStore = CNContactStore()
    let fetchRequest = CNContactFetchRequest(keysToFetch: allContactKeys)
    try contactStore.enumerateContacts(with: fetchRequest) { con, response in
        print("Connection Name:", con.givenName, con.familyName)
//        print(
        let localCon = LocalContactObject(fromContact: con)
        print(localCon)
        print(con);
    }
} catch let error {
    print("Failed to retreive Me contact: \(error)")
}
