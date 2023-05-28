import 'package:flutter/material.dart';
import 'package:gosec/Dashboard/DashWidgets/LiveSafeSpots/BusStationCard.dart';
import 'package:gosec/Dashboard/DashWidgets/LiveSafeSpots/HospitalCard.dart';
import 'package:gosec/Dashboard/DashWidgets/LiveSafeSpots/PharmacyCard.dart';
import 'package:gosec/Dashboard/DashWidgets/LiveSafeSpots/PoliceStationCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            HospitalCard(openMapFunc: openMap, key: Key("fcvgbghjnhnjm"),),
            PoliceStationCard(openMapFunc: openMap,key: Key("fcvjbjnjgbhnjm")),
            PharmacyCard(openMapFunc: openMap,key: Key("fcvggcvyhjnbhnjm")),
            BusStationCard(openMapFunc: openMap, key: Key("fcvgbhgvhbjnjm"))
          ]),
    );
  }

  static Future<void> openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$location';

    try {
      await launch(googleUrl);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Something went wrong! Call emergency numbers.");
    }
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }
}
