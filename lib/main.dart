import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:upatrol/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");

Image pfp = Image.asset("temp.jpg");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var snappy = await userCollection.get();
  debugPrint(snappy.toString());

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UPatrol",
      theme: ThemeData(
        useMaterial3: true,

        //Color
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),

        //Text
        textTheme: const TextTheme(
            displayLarge: TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        )),

        primaryColor: Colors.green,
      ),
      home: Scaffold(
        body: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
    );
  }
}
