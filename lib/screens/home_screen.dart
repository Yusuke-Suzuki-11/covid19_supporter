import 'package:covid19_supporter/config/palette.dart';
import 'package:covid19_supporter/widgets/custom_app_bar.dart';
import 'package:covid19_supporter/widgets/country_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CountryNotifier extends StateNotifier<String>{
  CountryNotifier() : super('USA');
  
  void setState(String value){
    state = value;
  }
}

final countryProvider = StateNotifierProvider<CountryNotifier, String>((ref) => CountryNotifier());

class HomeScreen extends ConsumerWidget{
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final test = context.read(countryProvider.notifier);
    print(test);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight, context.read(countryProvider.notifier))
        ],
      )
    );
  }
  
  SliverToBoxAdapter _buildHeader(double screenHeight, CountryNotifier countryProvider){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                Text(
                  'COVID-19',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ConutryDropdown(
                  ['CN', 'FR', 'IN', 'IT', 'UK', 'USA'],
                ),
              ],
        )
      ),
    );
  }
}