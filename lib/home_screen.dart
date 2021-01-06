import 'package:flutter/material.dart';
import 'package:movie_server/screens/hindi_dubbed/hindi_dubbed.dart';
import 'package:movie_server/screens/populer/populer_horizontal.dart';

class HomeScreen extends StatelessWidget {
  // realAds() {
  //   return Container(
  //     height: 80,
  //     color: Colors.blue,
  //     child: Text(
  //       "For Ads",
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 20,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 5,
              expandedHeight: 200,
              flexibleSpace: Image.asset(
                "assets/images/1.jpg",
                fit: BoxFit.cover,
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.people,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
              floating: true,
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              title: Text(
                "Movie Server",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
            ),
            SliverPadding(padding: EdgeInsets.only(top: 20)),
            SliverToBoxAdapter(
              child: PopulerRowContainer(),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 20)),
            SliverToBoxAdapter(
              child: HindiDubbed(),
            ),
            // SliverPadding(padding: EdgeInsets.only(top: 20)),
            // SliverToBoxAdapter(
            //   child: realAds(),
            // ),
            SliverPadding(padding: EdgeInsets.only(top: 20)),
            SliverToBoxAdapter(
              child: PopulerRowContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
