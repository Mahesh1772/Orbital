import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prototype_1/screens/guard_duty_tracker_screen.dart/guard_duty_tracker_screen.dart';
import 'package:prototype_1/util/text_styles/text_style.dart';
import 'package:recase/recase.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class DutyPersonnelDataSource extends DataGridSource {
  DutyPersonnelDataSource({required List<DutyPersonnel> dutyPersonnel}) {
    _dutyPersonnel = dutyPersonnel
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                columnName: 'rank',
                value: e.rank,
              ),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<int>(columnName: 'points', value: e.points),
            ]))
        .toList();
  }

  List<DataGridRow> _dutyPersonnel = [];

  @override
  List<DataGridRow> get rows => _dutyPersonnel;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'rank') {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16.0.sp),
          child: Center(
            child: Image.asset(
              "lib/assets/army-ranks/${dataGridCell.value.toString().toLowerCase()}.png",
              width: 35.w,
              color: rankColorPicker(dataGridCell.value.toString())
                  ? Colors.white
                  : null,
            ),
          ),
        );
      }

      return Container(
        padding: EdgeInsets.all(16.0.sp),
        child: Center(
          child: StyledText(
            dataGridCell.value.toString().titleCase,
            16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }).toList());
  }
}

rankColorPicker(String rank) {
  return (rank == 'REC' ||
      rank == 'PTE' ||
      rank == 'LCP' ||
      rank == 'CPL' ||
      rank == 'CFC' ||
      rank == '3SG' ||
      rank == '2SG' ||
      rank == '1SG' ||
      rank == 'SSG' ||
      rank == 'MSG');
}