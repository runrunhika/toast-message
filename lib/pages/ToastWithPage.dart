import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWith extends StatefulWidget {
  const ToastWith({Key? key}) : super(key: key);

  @override
  _ToastWithState createState() => _ToastWithState();
}

class _ToastWithState extends State<ToastWith> {
  final buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50),
    textStyle: TextStyle(fontSize: 20),
  );

  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

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
              child: Text("Show Bottom Toast"),
              onPressed: showBottomToast,
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: buttonStyle,
              child: Text("Show Top Toast"),
              onPressed: showTopToast,
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: buttonStyle,
              child: Text("Remove Queued Toast"),
              onPressed: showRemoveQueuedToast,
            ),
          ],
        ),
      ),
    );
  }

  void showBottomToast() => toast.showToast(
        child: buildToast(),
        gravity: ToastGravity.BOTTOM,
      );

  void showTopToast() => toast.showToast(
      child: buildToast(),
      positionedToastBuilder: (ctx, child) => Positioned(
            child: child,
            top: 150,
            left: 30,
            right: 0,
          ));

  void showRemoveQueuedToast() => toast.removeCustomToast();
  
  Widget buildToast() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.greenAccent, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check,
              color: Colors.black87,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              "This is a Custom Toast",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ],
        ),
      );
}
