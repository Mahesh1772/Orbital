import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype_1/text_style.dart';
import 'package:prototype_1/util/soldier_detailed_screen.dart';

class SoldierTile extends StatelessWidget {
  final String soldierName;
  final String soldierRank;
  final String soldierAttendance;
  final String soldierIcon;
  final Color tileColor;

  const SoldierTile(
      {super.key,
      required this.soldierIcon,
      required this.soldierName,
      required this.soldierRank,
      required this.tileColor,
      required this.soldierAttendance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SoliderDetailedScreen(
                soldierRank: soldierRank,
                soldierName: soldierName,
                soldierAttendance: soldierAttendance,
                soldierIcon: soldierIcon,
              ),
            ),
          );
        },
        child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SoliderDetailedScreen(
                  soldierAttendance: soldierAttendance,
                  soldierIcon: soldierIcon,
                  soldierName: soldierName,
                  soldierRank: soldierRank,
                ),
              ),);
        },
        child: Container(
            decoration: BoxDecoration(
                color: tileColor, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                //rank insignia
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(79, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                      ),
                      child: Image.asset(
                        soldierRank,
                        width: 30,
                      ),
                    ),
                  ],
                ),

              //soldier icon
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Image.asset(
                  soldierIcon,
                  width: 90,
                ),
              ),

              //name

              Center(
                child: Text(
                  soldierName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              StyledText(soldierAttendance, 14)
            ],
          ),
        ),
      ),
    );
  }
}
