import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todohive/screen/todohome.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void splashscreen() {
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return homePage();
      }));
    });
  }

  @override
  void initState() {
    splashscreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 200,
          child: Image.network(
              'https://images.unsplash.com/photo-1682685796852-aa311b46f50d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
