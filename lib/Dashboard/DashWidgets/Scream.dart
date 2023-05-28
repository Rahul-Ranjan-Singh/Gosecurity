import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:location/location.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gosec/Dashboard/ContactScreens/phonebook_view.dart';

class Scream extends StatefulWidget {
  const Scream({required Key key}) : super(key: key);

  @override
  _ScreamState createState() => _ScreamState();
}

class _ScreamState extends State<Scream> {


  bool _isRecording=false;
  // bool shakeDetector = false;
  List<String> numbers = [];

  checkGetHomeActivated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("_isRecording")==true){
      changeStateOfHomeSafe(true);
    }
    setState(() {
      _isRecording = prefs.getBool("_isRecording") ?? false;
    });
  }

  changeStateOfHomeSafe(value) async {
    if (value) {
      Fluttertoast.showToast(msg: "Service Activated in Background!");
    } else {
      Fluttertoast.showToast(msg: "Service Disabled!");
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _isRecording = value;
      prefs.setBool("_isRecording", value);
      if(_isRecording){
        start();
      }
      else{
        stop();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    const t = Duration(seconds:5);
    checkGetHomeActivated();
    // if(getHomeSafeActivated){
    //   print("&&&&&&&&&&&&&&&&&&&*****************");
    //   Timer.periodic(Duration(seconds: 10), (Timer t) => sendPeriodicMsg());
    // }
  }
  void dispose() {

    super.dispose();
  }

  void onData() {
    this.setState(() {

    });




  }

  void onError(Object error) {
    print(error.toString());
    _isRecording = false;
  }

  void start() async {
    try {

    } catch (err) {
      print(err);
    }
  }

  void stop() async {
    try {

      this.setState(() {
        this._isRecording = false;
      });
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  sendAlert() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> numbers = prefs.getStringList("numbers") ?? [];
    // LocationData myLocation;
    String error;
    // Location location = new Location();
    String link = '';
    try {
      // myLocation = await location.getLocation();
      // var currentLocation = myLocation;

      if (numbers.isEmpty) {
        return Fluttertoast.showToast(
          msg: 'No Contacts Found!',
          backgroundColor: Colors.red,
        );
      } else {
        //var coordinates =
        //    Coordinates(currentLocation.latitude, currentLocation.longitude);
        //var addresses =
        //    await Geocoder.local.findAddressesFromCoordinates(coordinates);
        // var first = addresses.first;
        String li =
            // "http://maps.google.com/?q=${currentLocation.latitude},${currentLocation.longitude}";
            "http://maps.google.com/?q=";
        link = "SOS!! I am in danger, Please hep me\n$li";
        for (int i = 0; i < numbers.length; i++) {
          sendSMS(numbers[i].split("***")[1], link);
        }
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Please grant permission';
        print('Error due to Denied: $error');
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied- please enable it from app settings';
        print("Error due to not Asking: $error");
      }
      // myLocation = null;
    }
  }
  void sendSMS(String number, String msgText) {
    print(number);
    print(msgText);


  }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: InkWell(
        onTap: () {
          showModelSafeHome(_isRecording);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        title: Text("Scream Alert"),
                        subtitle: Text("Detects scream to send alerts"),
                      ),
                      Visibility(
                        visible: _isRecording,
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                SpinKitDoubleBounce(
                                  color: Colors.red,
                                  size: 15,
                                ),
                                SizedBox(width: 15),
                                Text("Activated...",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 10)),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/scream.png",
                      height: 140,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  showModelSafeHome(bool processRunning) async {
    int selectedContact = -1;
    bool getHomeActivated = processRunning;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        enableDrag: true,
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                                indent: 20,
                                endIndent: 20,
                              )),
                          Text("We are with you!!"),
                          Expanded(
                              child: Divider(
                                indent: 20,
                                endIndent: 20,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF5F4F6)),
                      child: SwitchListTile(
                        secondary: Lottie.asset("assets/routes.json"),
                        value: getHomeActivated,
                        onChanged: (val) async {
                          setModalState(() {
                            getHomeActivated = val;
                          });
                          if (getHomeActivated) {
                            changeStateOfHomeSafe(true);
                            // Timer.periodic(Duration(milliseconds: 0), (Timer t) => start());
                          } else {
                            changeStateOfHomeSafe(false);
                            // Timer.periodic(Duration(milliseconds: 0), (Timer t) => stop());
                            // await Workmanager().cancelByTag("3");
                          }
                        },
                        subtitle: Text(
                            "Get safe anywhere with scream alert"),
                      ),
                    ),
                    Expanded(
                        child: FutureBuilder(
                            future: getSOSNumbers(),
                            builder: (context,
                                AsyncSnapshot<List<String>> snapshot) {
                              if (snapshot.hasData &&
                                  snapshot!.data!.isNotEmpty) {
                                return ListView.separated(
                                    itemCount: snapshot.data!.length,
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        indent: 20,
                                        endIndent: 20,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      String contactData = snapshot.data![index];
                                      return ListTile(
                                        onTap: () {
                                          setModalState(() {
                                            selectedContact = index;
                                          });
                                        },
                                        leading: CircleAvatar(
                                          backgroundImage:
                                          AssetImage("assets/user.png"),
                                        ),
                                        title:
                                        Text(contactData.split("***")[0]),
                                        subtitle:
                                        Text(contactData.split("***")[1]),
                                        trailing: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        )
                                      );
                                    });
                              } else {
                                return ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PhoneBook(),
                                      ),
                                    );
                                  },
                                  title: Text("No contact found!"),
                                  subtitle:
                                  Text("Please add atleast one Contact"),
                                  trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey),
                                );
                              }
                            }))
                  ],
                ),
              );
            },
          );
        });
  }

  Future<List<String>> getSOSNumbers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    numbers = prefs.getStringList("numbers") ?? [];

    return numbers;
  }
}
