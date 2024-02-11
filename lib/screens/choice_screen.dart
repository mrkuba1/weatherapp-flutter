import 'package:flutter/material.dart';
import 'package:weatherapp/models/city.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    List<City> cities = City.defaultCitiesList
        .where((city) => city.isDefault == false)
        .toList();
    List<City> selectedCities = City.getSelectedCities();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose cities'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                Checkbox(
                  value: cities[index].isSelected,
                  onChanged: (bool? isSelected) {
                    setState(() {
                      cities[index].isSelected = isSelected ?? false;
                    });
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(cities[index].name)
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.pin_drop),
        onPressed: () {
          // ignore: avoid_print
          print(selectedCities.toString());
        },
      ),
    );
  }
}
