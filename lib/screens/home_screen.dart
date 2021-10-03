import 'package:covid19_supporter/config/palette.dart';
import 'package:covid19_supporter/config/styles.dart';
import 'package:covid19_supporter/data/data.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      )
    );
  }
  
  SliverToBoxAdapter _buildHeader(double screenHeight){
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you feeling sick?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  'if you feel sick with any COVID-19 symptoms, please call or text us immediately for help',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20
                          )
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                      ),
                      onPressed: (){},
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call now',
                        style: Styles.buttonTextStyle,
                      ),
                    ),
                    TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20
                          )
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                      ),
                      onPressed: (){},
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Send SMS',
                        style: Styles.buttonTextStyle,
                      ),
                    )
                  ]
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
  SliverToBoxAdapter _buildPreventionTips(screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prevention Tips",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(
              height: 20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention.map(
                (e) => Column(
                  children: [
                    Image.asset(
                      e.keys.first,
                      height: screenHeight * 0.12,
                    ),
                    SizedBox(
                      height: screenHeight * 0.015
                    ),
                    Text(
                      e.values.first,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.center
                    )
                  ],
                )
              ).toList(),
            )
          ],
        )
      )
    );
  }
  
  SliverToBoxAdapter _buildYourOwnTest(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Do your own test!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Follow the instructions\nto do your own test.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ]
        )
      )
    );
  }
}