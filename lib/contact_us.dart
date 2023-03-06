import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Row(
          children: const [
            Text("Contact Us"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.perm_contact_cal_rounded),
            )
          ],
        ),
        centerTitle: true,

      ),
    );
  }
}
