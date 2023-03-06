import 'package:flutter/material.dart';
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Row(
          children: const [
            Text("Privacy Policy"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.privacy_tip_sharp),
            )
          ],
        ),
        centerTitle: true,

      ),
    );
  }
}
