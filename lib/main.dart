import 'package:flutter/material.dart';
import 'package:toys_app/my_toys.dart';
import 'package:toys_app/toys_list.dart';
import 'toy_details.dart';
import 'contact_us.dart';
import 'about_us.dart';
import 'privacy_policy.dart';
import 'logout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/ToysDetails' : (context) => const ToysDetails(),
       '/ContactUs' : (context) => const ContactUs(),
        '/AboutUs' : (context) => const AboutUs(),
        '/PrivacyPolicy': (context) => const PrivacyPolicy(),
        '/Logout' : (context) => const Logout(),


      },
      theme: ThemeData(
           colorScheme: ColorScheme.fromSwatch().copyWith(
             primary: Colors.indigoAccent,
      ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
 TabController? controller;

  @override
  void initState(){
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Toyz App"),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              onSelected: (value) => onSelected(context, value),
                itemBuilder: (context) {
              return const[
                PopupMenuItem(
                  value: 1,
                  child: Text("Contact Us"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("About Us"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Privacy Policy"),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text("Logout"),
                ),

              ];

            }
            ),
          ],
          bottom:  TabBar(
            controller: controller,
            tabs: const [
            Tab(text: "Toys List",),
            Tab(text: "My Toys")
          ],
          ) ,
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            ToysList(),MyToys()
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed:() {
        Navigator.pushNamed(context, '/ToysDetails');

        },
          label: const Text( "Add a Toy", style: TextStyle(
            fontSize: 20,
            //fontWeight: FontWeight.bold,
          ) ,),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.indigoAccent,


        ),
       // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  onSelected(BuildContext context, value) {
    switch (value){
      case 1:
        Navigator.pushNamed(context, '/ContactUs');
        break;
      case 2:
        Navigator.pushNamed(context, '/AboutUs');
        break;
      case 3:
        Navigator.pushNamed(context, '/PrivacyPolicy');
        break;
      case 4:
        Navigator.pushNamed(context, '/Logout');
        break;
      default:
        break;
    }
  }
}
