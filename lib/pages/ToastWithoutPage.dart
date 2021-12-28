import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWithout extends StatefulWidget {
  const ToastWithout({Key? key}) : super(key: key);

  @override
  _ToastWithoutState createState() => _ToastWithoutState();
}

class _ToastWithoutState extends State<ToastWithout> {
  final buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50),
    textStyle: TextStyle(fontSize: 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: buttonStyle,
              child: Text("Show Toast"),
              onPressed: showToast,
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: buttonStyle,
              child: Text("Cansel Toast"),
              onPressed: canselToast,
            ),
          ],
        ),
      ),
    );
  }

  void showToast() => Fluttertoast.showToast(
        msg: 'This is Long Toast',
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.lightGreen,
        textColor: Colors.red,
      );

  void canselToast() => Fluttertoast.cancel();
}
