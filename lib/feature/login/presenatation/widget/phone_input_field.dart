import 'package:bharat_lyak/feature/login/presenatation/widget/country_drop_down.dart';
import 'package:flutter/material.dart';

import 'country_model.dart';

final List<Country> countries = [
  Country(name: "India", code: "+91", flag: "🇮🇳"),
  Country(name: "Indonesia", code: "+62", flag: "🇮🇩"),
  Country(name: "USA", code: "+1", flag: "🇺🇸"),
];

class PhoneInputField extends StatefulWidget {
  final String selectedCode;
  final List<String> countryCodes;
  final ValueChanged<String?> onCodeChanged;
  final TextEditingController controller;

  const PhoneInputField({
    super.key,
    required this.selectedCode,
    required this.countryCodes,
    required this.onCodeChanged,
    required this.controller,
  });

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {

  late Country selectedCountry = countries[0];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Country Code Dropdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: CountryDropdown(
            selected: selectedCountry,
            countries: countries,
            onChanged: (value) {
              setState(() {
                selectedCountry = value!;
              });
            },
          ),
        ),

        const SizedBox(width: 10),

        /// Mobile Number Field
        Expanded(
          child: Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Mobile number",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}