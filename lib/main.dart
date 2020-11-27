import 'package:flutter/material.dart';
import 'communityCategories.dart';
import 'Controllers/filterController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'InsideAdView.dart';

void main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FilterController _filterController = Get.put(FilterController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CommunityCategories(),
      //CommunityCategories(),
    );
  }
}