import 'package:covid19_supporter/screens/home_screen.dart';
import 'package:covid19_supporter/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:covid19_supporter/screens/screens.dart';

final StateProvider currentIndexProvider = StateProvider((ref){
  return 0;
});

class BottomNavScreen extends ConsumerWidget{
  final List _screens = [
    HomeScreen(),
    StatusScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
    body: _screens[watch(currentIndexProvider).state],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.read(currentIndexProvider).state,
        onTap: (index) => watch(currentIndexProvider).state = index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: context.read(currentIndexProvider).state == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}