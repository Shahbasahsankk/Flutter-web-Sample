class NavBarItemsModel {
  final String name;

  NavBarItemsModel({
    required this.name,
  });
}

List<NavBarItemsModel> itemsList = [
  NavBarItemsModel(name: 'Home'),
  NavBarItemsModel(name: 'About'),
  NavBarItemsModel(name: 'History'),
  NavBarItemsModel(name: 'Contact'),
];
