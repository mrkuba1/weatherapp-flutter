class City {
  bool isSelected;
  final String name;
  final String country;
  final bool isDefault;
  City({
    required this.country,
    required this.isSelected,
    required this.name,
    required this.isDefault,
  });

  static List<City> defaultCitiesList = [
    City(
      isSelected: false,
      name: 'London',
      country: 'United Kingdom',
      isDefault: true,
    ),
    City(
      isSelected: false,
      name: 'Warsaw',
      country: 'Poland',
      isDefault: false,
    ),
    City(
      isSelected: false,
      name: 'Wien',
      country: 'Austria',
      isDefault: false,
    ),
    City(
      isSelected: false,
      name: 'Paris',
      country: 'France',
      isDefault: false,
    ),
    City(
      isSelected: false,
      name: 'Lisbon',
      country: 'Portugal',
      isDefault: false,
    ),
    City(
      isSelected: false,
      name: 'Stockholm',
      country: 'Sweden',
      isDefault: false,
    ),
    City(
      isSelected: false,
      name: 'Oslo',
      country: 'Norway',
      isDefault: false,
    ),
    City(
      isSelected: false,
      name: 'Berlin',
      country: 'Germany',
      isDefault: false,
    ),
    City(
      isSelected: false,
      name: 'Rome',
      country: 'Italy',
      isDefault: false,
    ),
  ];

  static List<City> getSelectedCities() {
    List<City> selectedCities = City.defaultCitiesList;
    return selectedCities.where((city) => city.isSelected == true).toList();
  }
}
