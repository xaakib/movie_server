import 'package:flutter/material.dart';
import 'package:movie_server/model/requearment.dart';

class RequermentDetails extends StatelessWidget {
  var requerment;

  final double expanded_height = 400;
  final double rounded_container_height = 50;

  RequermentDetails(this.requerment);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverHeader(requerment),
          SliverToBoxAdapter(
            child: _buildDetailsMovie(requerment),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsMovie(requerment) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMovieinfo(requerment),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                requerment.description,
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
              height: 170,
              color: Colors.red,
              child: Row(
                children: [],
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
          ],
        ),
      ),
    );
  }

  Widget _buildMovieinfo(requerment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              requerment.image,
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
                  requerment.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  requerment.releseDate,
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

  Widget _buildSliverHeader(requerment) {
    return SliverPersistentHeader(
      delegate: DetailsSliverDelegate(
        expanded_height,
        rounded_container_height,
        requerment,
      ),
    );
  }
}

class DetailsSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedheight;
  final double rounded_container_height;
  final RequearmentModel requerment;

  DetailsSliverDelegate(
    this.expandedheight,
    this.rounded_container_height,
    this.requerment,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.asset(
          requerment.image,
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
                  requerment.name,
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black26,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  requerment.releseDate,
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black26,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )),
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
