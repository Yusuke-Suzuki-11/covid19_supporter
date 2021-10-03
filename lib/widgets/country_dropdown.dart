import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConutryDropdown extends ConsumerWidget{
  final List<String> countries;
  final String country;
  final Function onChanged;
  
  ConutryDropdown(
    this.countries,
    this.country,
    this.onChanged
  );
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countries.map(
            (e) => DropdownMenuItem(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 12,
                    child: Image.asset(
                      'assets/images/${e.toLowerCase()}_flag.png'
                    )
                  ),
                  const SizedBox(width: 8),
                  Text(
                    e,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ]
              ),
              value: e,
            )
          ).toList()
        ),
      ),
    );
  }
}