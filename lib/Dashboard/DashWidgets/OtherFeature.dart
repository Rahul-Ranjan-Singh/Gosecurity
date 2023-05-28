import 'package:flutter/material.dart';
import 'package:gosec/Dashboard/DashWidgets/OtherFeatures/CameraDetection.dart';
import 'package:gosec/Dashboard/DashWidgets/OtherFeatures/Complaint.dart';
import 'package:gosec/Dashboard/DashWidgets/OtherFeatures/FakeCall.dart';
import 'package:gosec/Dashboard/DashWidgets/OtherFeatures/SelfDefence.dart';

class OtherFeature extends StatelessWidget {
  const OtherFeature({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          FakeCall(key: Key("fcvghbhbhnjm")),
          Complaint(key: Key("fcvgbhebbhnjm")),
          CameraDetection(key: Key("fcvgbbvbedhhnjm")),
          Defence(key: Key("fcvhbdgbhnjm"))
        ],
      ),
    );
  }
}
