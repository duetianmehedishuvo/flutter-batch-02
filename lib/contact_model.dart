class ContactModel {
  String name;
  String phone;
  String email;
  bool isFavourite;

  ContactModel({required this.name, this.phone = '0', this.email = '', this.isFavourite = false});

  void toggleFavourite() {
    isFavourite = !isFavourite;
  }
}
