import 'package:al_oficial_app/components/list-items.dart';
import 'package:al_oficial_app/components/top-bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_admob/firebase_admob.dart';

const APP_ID = "ca-app-pub-7611014775630061~7791054759";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: APP_ID != null ? [APP_ID] : null,
    keywords: ['Economy'],
  );

  BannerAd bannerAd;

  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: "ca-app-pub-7611014775630061/5611560071",
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
        });
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = buildBanner()..load();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Column(children: <Widget>[
        TopBar(),
        SizedBox(height: 25.0),
        Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Text('Al',
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 40))),
                Text('Oficial',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 40)))
              ],
            )),
        SizedBox(height: 40.0),
        Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(75.0))),
                child: ListFilteredStream()))
      ]),
    );
  }
}
