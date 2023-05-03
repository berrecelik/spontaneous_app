import 'package:data_architecture/data/notifiers/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'SPONTANEOUS',
            style: GoogleFonts.lobster(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 5),
          ),
          SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
              valueListenable: isConnectedNotifier,
              builder: (context, isConnected, child) {
                return Image.asset(
                  isConnected ? 'images/globe.png' : 'images/nowifi.png',
                  width: 250,
                  height: 300,
                );
              }),
          ValueListenableBuilder(
              valueListenable: dataNotifier,
              builder: (context, data, child) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.activity,
                        style: GoogleFonts.lobster(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "This is a ${data.type} type activity",
                        style: GoogleFonts.caveat(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ListTile(
                        title: Text(
                          data.participants.toString(),
                          style: GoogleFonts.lobster(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                          ),
                        ),
                        leading: Text(
                          "Participants",
                          style: GoogleFonts.lobster(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await dataNotifier.value.reset();
            },
            icon: Icon(
              Icons.add,
              color: Colors.blue[900],
            ),
            label: Text(
              "New Activity",
              style: GoogleFonts.caveat(
                color: Colors.blue[900],
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
              onPressed: () {
                dataNotifier.value.logData();
              },
              child: Text("Log data",
                  style: GoogleFonts.caveat(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ))),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
