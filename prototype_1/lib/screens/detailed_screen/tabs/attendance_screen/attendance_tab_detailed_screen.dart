import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prototype_1/screens/detailed_screen/util/book_in_out_tile.dart.dart';
import 'package:provider/provider.dart';

import '../../../../user_models/user_details.dart';

late Stream<QuerySnapshot> documentStream;
List<Map<String, dynamic>> userBookInStatus = [];

class AttendanceTab extends StatefulWidget {
  const AttendanceTab({
    super.key,
    required this.docID,
  });

  final String docID;

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  @override
  Widget build(BuildContext context) {
    final statusModel = Provider.of<UserData>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(30.sp),
        child: StreamBuilder<QuerySnapshot>(
          stream: statusModel.attendance_data(widget.docID),
          builder: (context, snapshot) {
            var users = snapshot.data?.docs.toList();

            if (snapshot.hasData) {
              userBookInStatus = [];

              for (var i = 0; i < users!.length; i++) {
                var data = users[i].data();
                userBookInStatus.add(data as Map<String, dynamic>);
                userBookInStatus[i]
                    .addEntries({'ID': users[i].reference.id}.entries);
              }
            }
            userBookInStatus.sort((m1, m2) {
              var r = DateFormat("E d MMM yyyy HH:mm:ss")
                  .parse(m1["date&time"])
                  .compareTo(DateFormat("E d MMM yyyy HH:mm:ss")
                      .parse(m2["date&time"]));
              if (r != 0) return r;
              return DateFormat("E d MMM yyyy HH:mm:ss")
                  .parse(m1["date&time"])
                  .compareTo(DateFormat("E d MMM yyyy HH:mm:ss")
                      .parse(m2["date&time"]));
            });

            userBookInStatus = userBookInStatus.reversed.toList();
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.outbond,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Book In / Book Out",
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 650.h,
                    child: ListView.builder(
                      itemCount: userBookInStatus.length,
                      padding: EdgeInsets.all(12.sp),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return BookInOutTile(
                          docID: widget.docID,
                          attendanceID: userBookInStatus[index]['ID'],
                          timeStamp: userBookInStatus[index]['date&time'],
                          isInsideCamp: userBookInStatus[index]['isInsideCamp'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
