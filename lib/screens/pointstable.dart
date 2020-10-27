import 'package:flutter/material.dart';

class PointsTable extends StatefulWidget {
  @override
  _PointsTableState createState() => _PointsTableState();
}

class _PointsTableState extends State<PointsTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pointtable"),
      ),
      body: Text("PointTable"),
    );
  }
}