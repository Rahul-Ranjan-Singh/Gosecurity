import 'package:flutter/material.dart';
import 'package:gosec/Dashboard/DashWidgets/Emergencies/AmbulanceEmergency.dart';
import 'package:gosec/Dashboard/DashWidgets/Emergencies/MetroEmergency.dart';
import 'package:gosec/Dashboard/DashWidgets/Emergencies/FirebrigadeEmergency.dart';
import 'package:gosec/Dashboard/DashWidgets/Emergencies/PoliceEmergency.dart';
import 'package:gosec/Dashboard/DashWidgets/Emergencies/WomenDistress.dart';

class Emergency extends StatelessWidget {
  const Emergency({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          WomenDistress(key: Key("fcvgbhnjm"),),
          PoliceEmergency(key: Key("fcvgbm")),
          MetroEmergency(key: Key("fcvjm")),
          AmbulanceEmergency(key: Key("fcvgbnjm")),
          FireEmergency(key: Key("cvgbhnjm"))
        ],
      ),
    );
  }
}
