import 'package:covid19_supporter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConutryDropdown extends ConsumerWidget{
  final List<String> countries;
  
  ConutryDropdown(
    this.countries,
  );
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: watch(countryProvider),
          items: countries
              .map((e) => DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 12.0,
                          child: Image.asset(
                            'assets/images/${e.toLowerCase()}_flag.png',
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          e,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    value: e,
                  ))
              .toList(),
          onChanged: (val){
            context.read(countryProvider.notifier).setState(val.toString());
          }
        ),
      ),
    );
  }
}