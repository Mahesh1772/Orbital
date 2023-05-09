// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:prototype_1/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype_1/constants.dart';
import 'package:prototype_1/util/current_strength_chart.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  List unitSoldiers = [
    //[ soldierName, soldierRank, tileColour, soldierAttendance, soldierIcon, rationType, dateOfBirth]

    [
      "Wei John Koh",
      "lib/assets/army-ranks/3sg.png",
      Colors.brown.shade800,
      "IN CAMP",
      "lib/assets/army-ranks/soldier.png"
    ],
    [
      "Sivagnanam Maheshwaran",
      "lib/assets/army-ranks/3sg.png",
      Colors.indigo.shade800,
      "IN CAMP",
      "lib/assets/army-ranks/soldier.png"
    ],
    [
      "Aakash Ramaswamy",
      "lib/assets/army-ranks/3sg.png",
      Colors.indigo.shade400,
      "NOT IN CAMP",
      "lib/assets/army-ranks/soldier.png"
    ],
    [
      "Nikhil Babu",
      "lib/assets/army-ranks/cfc.png",
      Colors.teal.shade800,
      "IN CAMP",
      "lib/assets/army-ranks/men.png"
    ],
    [
      "John Doe",
      "lib/assets/army-ranks/lcp.png",
      Colors.teal.shade400,
      "NOT IN CAMP",
      "lib/assets/army-ranks/men.png"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: StyledText('Dashboard', 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'lib/assets/user.png',
                      width: 50,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: StyledText('Welcome,\nAakash! 👋', 32),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(10.0, 10.0),
                          blurRadius: 2.0,
                          spreadRadius: 2.0),
                    ],
                    color: accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Strength In-Camp",
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          const InkWell(
                            child: Icon(
                              Icons.more_vert_sharp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "As of ${DateFormat('yMMMMd').add_Hm().format(DateTime.now())}",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.45)),
                      ),
                      const SizedBox(
                        height: defaultPadding + 2,
                      ),
                      CurrentStrengthChart(),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const CurrentStrengthBreakdownTile(
                        title: "Total Officers",
                        imgSrc: "lib/assets/icons8-medals-64.png",
                        currentNumOfSoldiers: 6,
                        totalNumOfSoldiers: 9,
                        imgColor: Colors.red,
                      ),
                      const CurrentStrengthBreakdownTile(
                        title: "Total WOSEs",
                        imgSrc: "lib/assets/icons8-soldier-man-64.png",
                        currentNumOfSoldiers: 74,
                        totalNumOfSoldiers: 117,
                        imgColor: Colors.blue,
                      ),
                      const CurrentStrengthBreakdownTile(
                        title: "On Status",
                        imgSrc: "lib/assets/icons8-error-64.png",
                        currentNumOfSoldiers: 25,
                        totalNumOfSoldiers: 126,
                        imgColor: Colors.yellow,
                      ),
                      const CurrentStrengthBreakdownTile(
                        title: "On MA",
                        imgSrc: "lib/assets/icons8-doctors-folder-64.png",
                        currentNumOfSoldiers: 1,
                        totalNumOfSoldiers: 126,
                        imgColor: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentStrengthBreakdownTile extends StatelessWidget {
  const CurrentStrengthBreakdownTile({
    super.key,
    required this.title,
    required this.imgSrc,
    required this.currentNumOfSoldiers,
    required this.totalNumOfSoldiers,
    required this.imgColor,
  });

  final String title, imgSrc;
  final int currentNumOfSoldiers, totalNumOfSoldiers;
  final Color imgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPadding,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.blue.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              imgSrc,
              color: imgColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$currentNumOfSoldiers In Camp",
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.45),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "$currentNumOfSoldiers / $totalNumOfSoldiers",
            style: GoogleFonts.poppins(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
