import 'package:flutter/material.dart';
import 'package:hello_world/add_contact_screen.dart';
import 'package:hello_world/contact_db.dart';
import 'package:hello_world/widgets/custom_app_bar.dart';
import 'package:hello_world/widgets/custom_service.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'Contact List', isShowBackButton: false, fromContactListScreen: true),
      // conditional operators
      // Ternary operators
      body: ContactDB.contacts.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddContactScreen()));
                  },
                  child: Text('Add New Contact'),
                ),
                Text('No Data Available')
              ],
            ))
          : ListView.builder(
              itemCount: ContactDB.contacts.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(ContactDB.contacts[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: (){
                              makePhoneCall(ContactDB.contacts[index].phone);
                            },
                            child: Text(ContactDB.contacts[index].phone)),
                        InkWell(
                            onTap: (){
                              openMail(ContactDB.contacts[index].email);
                            },
                            child: Text(ContactDB.contacts[index].email)),
                      ],
                    ),
                    trailing: Switch(value: ContactDB.contacts[index].isFavourite, onChanged: (bool value) {

                      setState(() {
                        ContactDB.contacts[index].toggleFavourite();
                      });

                    }),
                  ),
                );
              }),
    );
  }
}
