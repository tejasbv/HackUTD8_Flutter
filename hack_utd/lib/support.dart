import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const s = "Please call 911 to gain access to medical support";
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            const Color(0xFF0652C5),
            Colors.lightGreenAccent.shade200
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Text(
              s,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: null /*(){launch("tel://4694655534")}*/,
              child: Text("Call"))
        ],
      ),
    );
  }
}
