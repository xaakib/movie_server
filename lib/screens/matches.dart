import 'package:flutter/material.dart';
import 'package:movie_server/model/myfontstyle.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  getnextMovie() async {
    List infos = [];
    String url = 'https://www.iplt20.com/matches/schedule/men';
    var response = await http.get(url);
    dom.Document document = parser.parse(response.body);
    final nameclass = document.getElementsByClassName('fixture__team-name');
    print(nameclass[0].innerHtml);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              height: 25,
              child: Text(
                "Movie Server",
              ),
            )
          ],
        ),
      ),
    );
  }
}
