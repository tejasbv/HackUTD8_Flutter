import 'package:flutter/material.dart';
import 'package:hack_utd/Survey/survey.dart';

class ClaimStart extends StatelessWidget {
  int picNum = 0;

  @override
  Widget build(BuildContext context) {
    void setPicnum(int a) {
      picNum = a;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Survey()));
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.redAccent])),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Welcome to the State Farm QuickQlaim",
                style: TextStyle(fontSize: 65, color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "please choose the type of the accident",
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: IconButton(
                  onPressed: () => {setPicnum(0), print("TBoned Selected")},
                  icon: Image.asset('assets/TBoned.png'),
                ),
                width: 200,
                height: 100,
              ),
              const Text(
                "T-Bone accident",
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: () => {setPicnum(1), print("HeadOn Selected")},
                  icon: Image.asset('assets/HeadOn.png'),
                ),
                width: 200,
                height: 100,
              ),
              const Text(
                "Head On accident",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: () => {setPicnum(2), print("SideSwiped Selected")},
                  icon: Image.asset('assets/SideSwiped.png'),
                ),
                width: 200,
                height: 100,
              ),
              const Text(
                "Side Swiped accident",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: () => {setPicnum(3), print("RearEnded Selected")},
                  icon: Image.asset('assets/RearEnded.png'),
                ),
                width: 200,
                height: 100,
              ),
              const Text(
                "Rear Ended accident",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: () => {setPicnum(4), print("Pedestrian Selected")},
                  icon: Image.asset('assets/Pedestrian.png'),
                ),
                width: 200,
                height: 100,
              ),
              const Text(
                "Pedestrian accident",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: () =>
                      {setPicnum(5), print("SingleVehicle Selected")},
                  icon: Image.asset('assets/SingleVehicle.png'),
                ),
                width: 200,
                height: 100,
              ),
              const Text(
                "Single Vehicle accident",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )),
      ),
    ));
  }
}
