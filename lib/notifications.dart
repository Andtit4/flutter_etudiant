import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                    width: width * .1,
                    height: height * .05,
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "12",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: height * .05,
            ),
            SizedBox(
              height: height * .7,
              width: width ,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width ,
                      height: height * .1,
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
