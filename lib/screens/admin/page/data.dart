import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Data Siswa :"),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 30,
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.arrow_left),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Container(
                            height: 18,
                            width: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(Icons.list)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              height: height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  sortColumnIndex: 0,
                  horizontalMargin: 10,
                  headingRowHeight: 40,
                  columnSpacing: 10,
                  sortAscending: true,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text("No."),
                    ),
                    DataColumn(label: Text("NIS")),
                    DataColumn(label: Text("Nama")),
                    DataColumn(label: Text("Kelas")),
                  ],
                  rows: <DataRow>[
                    dataRow(1, 17006912,
                        'akasdsadasdsadsasdsadasdasdsadsadsadsau', 'XII RPL A'),
                    dataRow(2, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006112, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII RPL A'),
                    dataRow(1, 17006912, 'aku', 'XII TITL A'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  DataRow dataRow(int no, int nis, nama, kelas) {
    return DataRow(
      cells: <DataCell>[
        DataCell(
          Text(
            no.toString(),
          ),
          onTap: () => tapped(nis.toString(), nama, kelas, context),
        ),
        DataCell(
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 60),
              child: Text(
                nis.toString(),
                overflow: TextOverflow.ellipsis,
              )),
          onTap: () => tapped(nis.toString(), nama, kelas, context),
        ),
        DataCell(
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 150),
              child: Text(
                nama,
                overflow: TextOverflow.ellipsis,
              )),
          onTap: () => tapped(nis.toString(), nama, kelas, context),
        ),
        DataCell(
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 60),
              child: Text(
                kelas,
                overflow: TextOverflow.ellipsis,
              )),
          onTap: () => tapped(nis.toString(), nama, kelas, context),
        ),
      ],
    );
  }

  void tapped(nis, nama, kelas, context) {
    final height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Detail Data Siswa'),
            content: Container(
              height: height / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nis.toString()),
                  Text(nama),
                  Text(kelas),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                child: Text("Hapus"),
                onPressed: () {},
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("Ubah"),
                onPressed: () {
                  editData(nis, nama, kelas, height);
                },
              ),
            ],
          );
        });
  }

  void editData(nis, nama, kelas, height) {
    TextEditingController controllerNis =
        TextEditingController(text: nis.toString());
    TextEditingController controllerNama = TextEditingController(text: nama);
    TextEditingController controllerKelas = TextEditingController(text: kelas);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ubah Data"),
            content: Container(
              height: height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    controller: controllerNis,
                  ),
                  TextField(
                    controller: controllerNama,
                  ),
                  TextField(
                    controller: controllerKelas,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                child: Text("Simpan"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}