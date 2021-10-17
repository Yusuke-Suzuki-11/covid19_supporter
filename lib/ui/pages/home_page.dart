import 'package:covid19_supporter/config/api_endpoints.dart';
import 'package:covid19_supporter/config/palette.dart';
import 'package:covid19_supporter/repository/api/today_prefectures_client.dart';
import 'package:covid19_supporter/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
         Column(
          children: [
            // SliverToBoxAdapter(
            //   child: Container(
            //     padding: const EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //       color: Palette.primaryColor,
            //       borderRadius: BorderRadius.only(
            //         bottomRight: Radius.circular(40),
            //         bottomLeft: Radius.circular(40),
            //       )
            //     ),
            //   ),
            // ),
            FutureBuilder(
              future: Client.getTest(),
              builder: (context, AsyncSnapshot<List<Widget>> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }
                return Flexible(child: ListView(children: snapshot.data!));
              }
            ),
          ],
        ),
        ]
      )
    );
  }
  
  AppBar _getAppBar(){
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.green,
      title: Text(''),
      leading: IconButton(
        icon: Icon(Icons.chat_bubble),
        onPressed: () {
          Client.getTestButton();
        },
      ),
    
    );
  }
}