import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_project_2/prototype_1_lib/lib/screens/detailed_screen/soldier_detailed_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardSoldierTile extends StatelessWidget {
  final String soldierName;
  final String soldierRank;
  final String company;
  final String platoon;
  final String section;
  final String soldierAppointment;
  final String dateOfBirth;
  final String rationType;
  final String bloodType;
  final String enlistmentDate;
  final String ordDate;
  final String docID;
  final bool isToggled;

  const DashboardSoldierTile({
    super.key,
    required this.soldierName,
    required this.soldierRank,
    required this.company,
    required this.platoon,
    required this.section,
    required this.soldierAppointment,
    required this.dateOfBirth,
    required this.rationType,
    required this.bloodType,
    required this.enlistmentDate,
    required this.ordDate,
    required this.docID,
    required this.isToggled,
  });

  @override
  Widget build(BuildContext context) {
    String soldierIconGenerator(String rank) {
      if (rank == 'lib/assets/army-ranks/rec.png' ||
          rank == 'lib/assets/army-ranks/pte.png' ||
          rank == 'lib/assets/army-ranks/lcp.png' ||
          rank == 'lib/assets/army-ranks/cpl.png' ||
          rank == 'lib/assets/army-ranks/cfc.png') {
        return "lib/assets/army-ranks/men.png";
      } else {
        return "lib/assets/army-ranks/soldier.png";
      }
    }

    Color soldierColorGenerator(String rank) {
      if (rank == 'lib/assets/army-ranks/rec.png' ||
          rank == 'lib/assets/army-ranks/pte.png' ||
          rank == 'lib/assets/army-ranks/lcp.png' ||
          rank == 'lib/assets/army-ranks/cpl.png' ||
          rank == 'lib/assets/army-ranks/cfc.png') {
        return Colors.brown.shade800;
      } else if (rank == 'lib/assets/army-ranks/sct.png') {
        return Colors.brown.shade400;
      } else if (rank == 'lib/assets/army-ranks/3sg.png' ||
          rank == 'lib/assets/army-ranks/2sg.png' ||
          rank == 'lib/assets/army-ranks/1sg.png' ||
          rank == 'lib/assets/army-ranks/ssg.png' ||
          rank == 'lib/assets/army-ranks/msg.png') {
        return Colors.indigo.shade800;
      } else if (rank == 'lib/assets/army-ranks/3wo.png' ||
          rank == 'lib/assets/army-ranks/2wo.png' ||
          rank == 'lib/assets/army-ranks/1wo.png' ||
          rank == 'lib/assets/army-ranks/mwo.png' ||
          rank == 'lib/assets/army-ranks/swo.png' ||
          rank == 'lib/assets/army-ranks/cwo.png') {
        return Colors.indigo.shade400;
      } else if (rank == 'lib/assets/army-ranks/oct.png') {
        return Colors.teal.shade900;
      } else if (rank == 'lib/assets/army-ranks/2lt.png' ||
          rank == 'lib/assets/army-ranks/lta.png' ||
          rank == 'lib/assets/army-ranks/cpt.png') {
        return Colors.teal.shade800;
      } else {
        return Colors.teal.shade400;
      }
    }

    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SoldierDetailedScreen(
                docID: docID,
                isToggled: isToggled,
              ),
            ),
          );
        },
        child: Container(
          width: 200.w,
          height: 350.h,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 2.0.r,
                    spreadRadius: 2.0.r,
                    offset: Offset(10.w, 10.h),
                    color: Colors.black54)
              ],
              color: soldierColorGenerator(
                "lib/assets/army-ranks/${soldierRank.toString().toLowerCase()}.png",
              ),
              borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //soldier icon
                  Image.asset(
                    soldierIconGenerator(
                        "lib/assets/army-ranks/${soldierRank.toString().toLowerCase()}.png"),
                    width: 60.w,
                  ),

                  //rank insignia
                  Image.asset(
                    "lib/assets/army-ranks/${soldierRank.toString().toLowerCase()}.png",
                    width: 30.w,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              AutoSizeText(
                soldierName,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
              //StyledText(soldierName, 20.sp, fontWeight: FontWeight.bold)
            ],
          ),
        ),
      ),
    );
  }
}
