import 'package:hello_world/contact_model.dart';

// state manage kora
// database , localcash , state management
// BIOS theke Configurations-> VT-x  Enable

class ContactDB {
  static List<ContactModel> contacts = [];

  void addContactData(ContactModel contact){
    contacts.add(contact);
  }

}
