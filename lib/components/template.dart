import 'package:flutter/material.dart';

//insert query here
var reportsList = List<bool>;

class Dashboard extends StatefulWidget {
  final Widget bodyWidget;

  const Dashboard({
    super.key,
    required this.bodyWidget,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: SizedBox(
            width: 40,
            height: 40,
            child: Image.asset("assets/logo.png"),
          ),
          title: const Text("Dashboard"),
        ),
        body: widget.bodyWidget,
        drawer: Drawer(
          child: ListView(
            children: [
              const Spacer(),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 75,
                        height: 75,
                        child: Image.asset("assets/images/UPatrol-logo.png"),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Row(
                        children: [Text("UserName")],
                      ),
                      Row(
                        children: [Text("User")],
                      )
                    ],
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.home_outlined, size: 48),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Roboto",
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.history, size: 48),
                  Text(
                    "History",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Roboto",
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.settings_outlined, size: 48),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Roboto",
                    ),
                  )
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
