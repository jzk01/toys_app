import 'package:flutter/material.dart';
class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Row(
          children: const [
            Text("Logout"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            )
          ],
        ),
        centerTitle: true,

      ),
    );
  }
}
