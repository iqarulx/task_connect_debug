import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:task_connect_debug/view/utils/colors.dart';

class TaskList {
  TaskList(
      this.sno,
      this.viewTask,
      this.subject,
      this.recipient,
      this.department,
      this.description,
      this.priority,
      this.startDate,
      this.endDate,
      this.kpiClock,
      this.start,
      this.completedExtend,
      this.reallocation,
      this.reject,
      this.nextStep);
  final String sno,
      subject,
      recipient,
      department,
      description,
      priority,
      startDate,
      endDate,
      kpiClock,
      nextStep;
  final Widget viewTask, completedExtend, start, reallocation, reject;
}

class TaskListDataSource extends DataGridSource {
  TaskListDataSource({required List<TaskList> taskListData}) {
    _taskListData = taskListData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'sno', value: e.sno),
              DataGridCell<Widget>(columnName: 'viewTask', value: e.viewTask),
              DataGridCell<String>(columnName: 'subject', value: e.subject),
              DataGridCell<String>(columnName: 'recipient', value: e.recipient),
              DataGridCell<String>(
                  columnName: 'department', value: e.department),
              DataGridCell<String>(
                  columnName: 'description', value: e.description),
              DataGridCell<String>(columnName: 'priority', value: e.priority),
              DataGridCell<String>(columnName: 'startDate', value: e.startDate),
              DataGridCell<String>(columnName: 'endDate', value: e.endDate),
              DataGridCell<String>(columnName: 'kpiClock', value: e.kpiClock),
              DataGridCell<Widget>(columnName: 'start', value: e.start),
              DataGridCell<Widget>(
                  columnName: 'completedExtend', value: e.completedExtend),
              DataGridCell<Widget>(
                  columnName: 'reallocation', value: e.reallocation),
              DataGridCell<Widget>(columnName: 'reject', value: e.reject),
              DataGridCell<String>(columnName: 'nextStep', value: e.nextStep),
            ]))
        .toList();
  }

  List<DataGridRow> _taskListData = [];

  @override
  List<DataGridRow> get rows => _taskListData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'completedExtend' ||
            e.columnName == 'start' ||
            e.columnName == 'reallocation' ||
            e.columnName == 'reject' ||
            e.columnName == 'viewTask') {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: e.value as Widget,
          );
        } else if (e.columnName == 'sno') {
          var data = e.value.split('/');
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  data[0].toString(),
                  style: const TextStyle(color: greenColor),
                ),
                if (data[1].toString() != '')
                  Text(
                    "Reminder : ${data[1].toString()}",
                    style: const TextStyle(color: redColor),
                  ),
              ],
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }
      }).toList(),
    );
  }
}
