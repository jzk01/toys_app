import 'package:flutter/material.dart';
class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Row(
          children: const [
            Text("About Us"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.info),
            )
          ],
        ),
        centerTitle: true,

      ),
    );
  }
}
