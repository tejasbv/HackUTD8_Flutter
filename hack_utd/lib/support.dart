import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  call() {
    launch("tel://4694655534");
  }

  @override
  Widget build(BuildContext context) {
    const s = "Please call 911 to gain access to medical support";
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.redAccent])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: Text(
              s,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: call, //call(),
              child: const Center(child: Text("Call"))),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(
                  child: Text(
                "ignore",
                style: TextStyle(color: Colors.red),
              )),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)))
        ],
      ),
    )));
  }
}
