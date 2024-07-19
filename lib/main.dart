import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        drawerScrimColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 4, 42, 73),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 4, 42, 73),
          title: Text(
            'Attendance Table',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: AttendanceTable(),
      ),
    );
  }
}

class AttendanceTable extends StatefulWidget {
  @override
  _AttendanceTableState createState() => _AttendanceTableState();
}

class _AttendanceTableState extends State<AttendanceTable> {
  final List<String> students = [
    'Shuhrat Shoimardonov',
    'Shuhrat Mahmudzoda',
    'Hakim Sharifzoda',
    'Muin Aslamzoda',
    'Ahmad Hakimov',
    'Yormuhammad',
  ];

  final List<List<bool>> attendance =
      List.generate(6, (_) => List.filled(4, false));
  final List<List<int>> scores = List.generate(6, (_) => List.filled(4, 0));
  final List<int> bonuses = List.filled(6, 0);
  final List<int> exams = List.filled(6, 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 10,
        border: TableBorder.all(color: Colors.grey),
        columns: <DataColumn>[
          DataColumn(
              label: Text('Student', style: TextStyle(color: Colors.white))),
          for (int i = 0; i < 4; i++) ...[
            DataColumn(
                label: Text('10.07.2024\nAtt',
                    style: TextStyle(color: Colors.white))),
            DataColumn(
                label: Text('10.07.2024\nScore',
                    style: TextStyle(color: Colors.white))),
          ],
          DataColumn(
              label: Text('Bonus', style: TextStyle(color: Colors.white))),
          DataColumn(
              label: Text('Exam', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('Sum', style: TextStyle(color: Colors.white))),
        ],
        rows: List<DataRow>.generate(
          students.length,
          (index) => DataRow(
            cells: <DataCell>[
              DataCell(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(students[index],
                    style: TextStyle(color: Colors.white)),
              )),
              for (int i = 0; i < 4; i++) ...[
                DataCell(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Checkbox(
                    value: attendance[index][i],
                    onChanged: (value) {
                      setState(() {
                        attendance[index][i] = value!;
                      });
                    },
                  ),
                )),
                DataCell(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<int>(
                    dropdownColor: Color.fromARGB(255, 3, 21, 36),
                    value: scores[index][i],
                    items: List.generate(
                      6,
                      (j) => DropdownMenuItem(
                        value: j,
                        child:
                            Text('$j', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        scores[index][i] = value!;
                      });
                    },
                  ),
                )),
              ],
              DataCell(Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      bonuses[index] = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              )),
              DataCell(Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      exams[index] = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              )),
              DataCell(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (attendance[index].where((e) => e).length +
                          bonuses[index] +
                          exams[index] +
                          scores[index]
                              .reduce((value, element) => value + element))
                      .toString(),
                  style: TextStyle(color: Colors.white),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
