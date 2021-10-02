import 'package:covid19_supporter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}