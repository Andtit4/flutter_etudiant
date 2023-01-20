// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cine/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  // ignore: prefer_const_constructors
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String email = "";
  late String password = "";
  late String errormsg;
  late bool error = false;
  /*  late String email;r
  late String password; */

  login() async {
    print("Function login init");
    // ${email.test}
    print("Email: $email");
    print("Password: $password");

    String apiUrl = "http://192.168.137.191//backend/test/api/auth.php";

    var reponse = await http
        .post(Uri.parse(apiUrl), body: {'email': email, 'password': password});

    if (reponse.statusCode == 200) {
      var jsonData = json.decode(reponse.body);
      if (jsonData['error'] == true) {
        setState(() {
          error = true;
          errormsg = jsonData['data'];
        });
      } else {
      Get.offAll(() => const HomePage(), transition: Transition.leftToRight, duration: const Duration(milliseconds: 500));
      }

      print("Response body: $jsonData");
    }
  }

  /*  @override
  void initState() {
    // TODO: implement initState
/*     email = "";
    password = ""; */
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome\nLogin before continue",
                style: GoogleFonts.poppins(
                    fontSize: 27,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
             const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(10),
                child: error ? errmsg(errormsg) : Container(),
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    hintText: 'Adresse mail', hintStyle: GoogleFonts.poppins()),
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    hintText: 'Mot de passe', hintStyle: GoogleFonts.poppins()),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        "Connexion",
                        style: GoogleFonts.poppins(),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Pas de compte ?",
                        style: GoogleFonts.poppins(color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ))

        /* Column(
        children: [
          Text("data")
        ],
      ), */
        );
  }

  Widget errmsg(String text) {
    //error message widget.
    return Container(
      padding: EdgeInsets.all(15.00),
      margin: EdgeInsets.only(bottom: 10.00),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(30),
        color: Colors.red,
      ),
      child: Row(children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 6.00),
          child: Icon(Icons.info, color: Colors.white),
        ), // icon for error message

        Text(text,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: "Poppins")),
        //show error message text
      ]),
    );
  }
}
