import 'package:flutter/material.dart';
import 'package:movie_server/data/data.dart';
import 'package:movie_server/model/populer.dart';
import 'package:movie_server/screens/requerment/requerment_class.dart';

class DetailScreen extends StatelessWidget {
  var populer;
  final double expanded_height = 400;
  final double rounded_container_height = 50;

  DetailScreen(this.populer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverHeader(populer),
          SliverToBoxAdapter(
            child: _buildDetailsMovie(populer),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsMovie(populer) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMovieinfo(populer),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                populer.description,
                style: TextStyle(
                  color: Colors.black45,
                  height: 1.4,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              "Screenshorts",
              style: TextStyle(
                color: Colors.black87,
                height: 1.4,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 164,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: screenshorts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 250,
                            child: Image.asset(
                              screenshorts[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Requarment",
                  style: TextStyle(
                    color: Colors.black87,
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.red,
                      height: 1.4,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            //This the Requerment Class
            Requerment(),
          ],
        ),
      ),
    );
  }

//movie profile avatar and Tilte and Details thats mean Info
  Widget _buildMovieinfo(populer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              populer.image,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  populer.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  populer.releseDate,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
    );
  }

// Main header For Poster Image
  Widget _buildSliverHeader(populer) {
    return SliverPersistentHeader(
      delegate: DetailsSliverDelegate(
        expanded_height,
        rounded_container_height,
        populer,
      ),
    );
  }
}

//First Intro Image
class DetailsSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedheight;
  final double rounded_container_height;
  final Populer populer;

  DetailsSliverDelegate(
    this.expandedheight,
    this.rounded_container_height,
    this.populer,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.asset(
          populer.image,
          width: MediaQuery.of(context).size.width,
          height: expandedheight,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandedheight - rounded_container_height - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: rounded_container_height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: expandedheight - 160 - shrinkOffset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                populer.name,
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black26,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                populer.releseDate,
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black26,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedheight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
