import 'dart:async';
import 'dart:convert';


import 'package:ecomy/presentation/pdf_reading/manga_pdf_reading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pdfx/pdfx.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnimatedCards extends StatefulWidget {
 String pdfList;
 int index;

  AnimatedCards({required this.pdfList,  super.key,required this.index});

  @override
  State<AnimatedCards> createState() => _AnimatedCards();
}

class _AnimatedCards extends State<AnimatedCards> {
  // list to store accelerometer data
  List<AccelerometerEvent> _accelerometerValues = [];
  WebViewController webViewController = WebViewController();


  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();

    // Subscribe to accelerometer events
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      setState(() {
        // Update the _accelerometerValues list with the latest event
        _accelerometerValues = [event];
      });
    });
  }

// #444444

  @override
  void dispose() {
    // Cancel the accelerometer event subscription to prevent memory leaks
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  // const AnimatedCards({super.key});
  double _rotationX = 0.0;
  double _rotationY = 0.0;

  @override
  Widget build(BuildContext context)  {
    return    SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _rotationX += details.delta.dy * 0.01;
                    _rotationY -= details.delta.dx * 0.01;
                  });
                },
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateX(_rotationX)
                    ..rotateY(_rotationY),
                  child: Card(

                    margin: const EdgeInsets.all(20),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
                      ),
                    ),
                    elevation: 20,
                    shadowColor: Colors.grey,
                    child: SizedBox(
                      // assets/aot3.jpg
                      width: 400,
                      height: 600,
                      child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child:MangaPdfReading(pdfPath: widget.pdfList),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
