import 'package:flutter/material.dart';

import 'country_model.dart';

class CountryDropdown extends StatelessWidget {
  final Country selected;
  final List<Country> countries;
  final ValueChanged<Country?> onChanged;

  const CountryDropdown({
    super.key,
    required this.selected,
    required this.countries,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Country>(
          value: selected,
          onChanged: onChanged,

          /// 🔥 OPEN DROPDOWN UI
          items: countries.map((country) {
            return DropdownMenuItem(
              value: country,
              child: Row(
                children: [
                  Text(country.flag),
                  const SizedBox(width: 8),
                  Text("${country.name} (${country.code})"),
                ],
              ),
            );
          }).toList(),

          /// 🔥 CLOSED UI (IMPORTANT)
          selectedItemBuilder: (context) {
            return countries.map((country) {
              return Row(
                children: [
                  Text(country.flag),
                  const SizedBox(width: 6),
                  Text(country.code),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }
}