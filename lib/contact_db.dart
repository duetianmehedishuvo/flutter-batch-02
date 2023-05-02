import 'package:hello_world/contact_model.dart';

// state manage kora
// database , localcash , state management

class ContactDB {
  static List<ContactModel> contacts = [];

  void addContactData(ContactModel contact){
    contacts.add(contact);
  }

}
