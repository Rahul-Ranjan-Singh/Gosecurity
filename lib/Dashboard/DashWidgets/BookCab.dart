import 'package:flutter/material.dart';
import 'package:gosec/Dashboard/DashWidgets/Cab/Ola.dart';
import 'package:gosec/Dashboard/DashWidgets/Cab/Rapido.dart';

import 'Cab/Uber.dart';

class BookCab extends StatelessWidget {
  const BookCab({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            UberCard(key: Key("dxfcgvhb"),),
            OlaCard(key: Key("dxfcg")),
            RadpidoCard(key: Key("dxfcb"))
          ]),
    );
  }
}
