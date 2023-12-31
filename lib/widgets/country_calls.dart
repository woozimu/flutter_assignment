import 'package:assignment/widgets/call_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/home_screen_data.dart';

/// Widget for [countries]
class CountryCalls extends StatelessWidget {
  const CountryCalls({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenData homeScreenProvider = Provider.of<HomeScreenData>(context);

    return Column(
        children: homeScreenProvider.countries.keys.map((String country) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                          homeScreenProvider.countryFlags[country]!),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  country,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset:
                    const Offset(0, 3), // defines the position of the shadow
              ),
            ], borderRadius: BorderRadius.circular(30), color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
                children:
                    homeScreenProvider.countries[country]!.map((String item) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CallItem(
                    item: item,
                  ));
            }).toList()),
          )
        ],
      );
    }).toList());
  }
}
