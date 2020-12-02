import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'insideAdViewBottomBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_app/Controllers/communityAdList.dart';
import 'package:get/get.dart';

class CommunityInsideAdView extends StatefulWidget {
  final int index;
  CommunityInsideAdView(this.index);

  @override
  _CommunityInsideAdViewState createState() => _CommunityInsideAdViewState();
}

class _CommunityInsideAdViewState extends State<CommunityInsideAdView> {
  final Set<Marker> _markers = {};

  final PageController _pageController =
  PageController(viewportFraction: 0.9, initialPage: 0);
  CommunityAdListController _communityAdListController = Get.find();
  int currentAdImage = 0;
  int totalImage = 6;

 //GoogleMapController mapController;
 //final LatLng _center = const LatLng(33.6844, 73.0479);
 //void _onMapCreated(GoogleMapController controller) {
 //  mapController = controller;
  //}
  @override
  Widget build(BuildContext context) {
    _markers.add(Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: MarkerId("markers"),
      position: LatLng(25.276987, 55.296249),
    ));
    return Scaffold(
     backgroundColor: Colors.white,
      bottomNavigationBar: InsideAdBottomBar(),
      body: SingleChildScrollView(
      child: SafeArea(
      child: Column(
        children: [
          Container(
            height: 340,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          setState(() {
                            currentAdImage = value;
                          });
                        },
                        itemCount: _communityAdListController
                            .allCommunityList[widget.index].Images.length,
                        itemBuilder: (context, int index1) {
                          return CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                              'https://firebasestorage.googleapis.com/v0/b/elistad-d9339.appspot.com/o/Services%2F' +
                                  _communityAdListController
                                      .allCommunityList[widget.index]
                                      .Images[index1] +
                                  '.jpg?alt=media');
                        },
                    ),
                  ),
                ),
                Positioned(
                  top: 21,
                  left: 17,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset('assets/backButton.svg'),
                  ),
                ),
                Positioned(
                    right: 17,
                    top: 230,
                    width: 30,
                    height: 30,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset('assets/saved.svg'),
                    ),
                ),
                Positioned(
                    left: 24,
                    top: 226,
                    child: Text(
                      (currentAdImage + 1).toString() +
                          ' of ' +
                          _communityAdListController
                              .allCommunityList[widget.index].Images.length
                              .toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )),
                Positioned(
                    top: 231,
                    width: MediaQuery.of(context).size.width,
                    height: 7,
                    child: Center(
                      child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _communityAdListController
                              .allCommunityList[widget.index]
                              .Images
                              .length,
                          itemBuilder: (context, int index) {
                            return Container(
                              width: 11,
                              child: index == currentAdImage
                                  ? SvgPicture.asset(
                                  'assets/pageIndicatorFilled.svg')
                                  : SvgPicture.asset(
                                  'assets/pageIndicator.svg'),
                            );
                          }),
                    )),
                Positioned(
                    right: 64,
                    top: 230,
                    width: 30,
                    height: 30,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset('assets/shareButton.svg'),
                    )),

                Positioned(
                  top: 260,
                  left: 17,
                  child: Text(
                    _communityAdListController
                        .allCommunityList[widget.index].Title,
                  //  'Photo AND Video Services',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Roboto',
                        fontSize: 16),
                  ),
                ),
                Positioned(
                  top: 289 ,
                  left: 17,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Events  >  Photo',
                    style: TextStyle(
                        color: Color(0xFF6D6E70),
                        fontFamily: 'Roboto',
                        fontSize: 14),
                  ),
                ),


                Positioned(
                    right: 17,
                    top: 289,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/daysIcon.svg'),
                        SizedBox(width: 5.6),
                        Text(
                          ((DateTime.now().millisecondsSinceEpoch -
                              _communityAdListController
                                  .allCommunityList[
                              widget.index]
                                  .PostedOn
                                  .millisecondsSinceEpoch) /
                              (1000 * 86400))
                              .floor()
                              .toString() +
                              ' days ago',
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 10,
                              color: Color(0xFF6D6E70)),
                        )
                      ],
                    )),
                Positioned(
                  top: 314,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 5,
                    color: Color(0xFFECECEC),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height:0 ,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
               //height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //SizedBox(height: 0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Color(0xFF1B1C1E)),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    child: ReadMoreText(
                      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Color(0xFF6D6E70)),
                      trimLines: 2,
                      colorClickableText: Color(0xFF1877F2),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read More',
                      trimExpandedText: 'Read Less',
                      moreStyle: TextStyle(fontSize: 12,color:Color(0xFF1877F2) ),

                    ),
                  ),

                  SizedBox(height: 13),
                  Container(
                    width: double.infinity,
                    height: 5,
                    color: Color(0xFFECECEC),
                  ),
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    'Seller Profile',
                    style: TextStyle(color: Color(0xFF1B1C1E)),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 34),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/profileIcon.svg',
                        width: 47,
                        height: 47,
                      ),
                      SizedBox(width: 12),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alex Johns',
                              style: TextStyle(color: Color(0xFF6D6E70)),
                            ),

                            SizedBox(height: 4),
                            GestureDetector(
                              onTap: (){},
                              child: Text(
                                'View Profile',
                                style: TextStyle(color: Color(0xFF1877F2)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  width: double.infinity,
                  height: 5,
                  color: Color(0xFFECECEC),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Location',
                  style: TextStyle(color: Color(0xFF6D6E70), fontSize: 16),
                ),
                Text(
                  _communityAdListController
                      .allCommunityList[widget.index].Location,
                  style: TextStyle(color: Color(0xFF6D6E70), fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 205,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 17,
                  right: 17,
                  height: 190,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(26),
                        bottomRight: Radius.circular(26)),
                    child: GoogleMap(
                      markers: _markers,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(25.276987, 55.296249),
                        zoom: 6,
                      ),
                      onMapCreated: (GoogleMapController controller) {},
                    ),
                  ),
                ),

                //Chat & Call button

              ],
            ),

          ),
          SizedBox(height: 4),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AD ID: 34736274',
                  style: TextStyle(fontSize: 14, color: Color(0xFF6D6E70)),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/report.svg'),
                    SizedBox(width: 4),
                    Text(
                      'Report this listing',
                      style: TextStyle(color: Color(0xFF1877F2)),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 5,
            color: Color(0xFFECECEC),
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              'Similar Services',
              style: TextStyle(color: Color(0xFF1B1C1E), fontSize: 14),
            ),
          ),
          SizedBox(height: 13),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 17),
            height: 348,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, int index) {
                  return Container(
                    width: 308,
                    height: 289.78,
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Container(
                              width: 308,
                              height: 175,
                              child: Image.asset('assets/car.png')),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('AED 500,000',
                            style: TextStyle(
                                color: Color(0xFF1877F2),
                                fontSize: 14,
                                fontFamily: 'Roboto-Medium')),
                        SizedBox(
                          height: 6,
                        ),
                        Text('New Televisions for All',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto-Regular',
                                color: Color(0xFF6D6E70))),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Electronics' + ' · ' + 'Televisions',
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              color: Color(0xFF6D6E70),
                              fontSize: 10),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          width: 308,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/locationIcon.svg'),
                                  SizedBox(width: 3.71),
                                  Text(
                                    'City Center',
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 10,
                                        color: Color(0xFF6D6E70)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/daysIcon.svg'),
                                  SizedBox(width: 3.71),
                                  Text(
                                    '5 days ago',
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 10,
                                        color: Color(0xFF6D6E70)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            width: double.infinity,
            height: 5,
            color: Color(0xFFECECEC),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: [
                Container(
                  color: Color(0xFF1877F2),
                  height: 12,
                  width: 3,
                ),
                SizedBox(width: 8),
                Text(
                  'Safety Tips!',
                  style: TextStyle(
                      fontFamily: 'Roboto', color: Color(0xFF1B1C1E)),
                )
              ],
            ),
          ),
          Container(
            height: 76,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    alignment: Alignment.centerLeft,
                    child: Text('• Never transfer money in advance')),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    alignment: Alignment.centerLeft,
                    child: Text('• Meet the seller at a public place.')),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    alignment: Alignment.centerLeft,
                    child: Text('• Avoid items with unrealistic prices.')),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 17),
                    alignment: Alignment.centerLeft,
                    child:
                    Text("• Don't proceed if something seems wrong")),
              ],
            ),
          ),
          SizedBox(
            height: 68.5,
          ),
        ],
      ),
      ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFECECEC)))),
        height: 60.0,
        alignment: Alignment.center,
        child: Container(
          width: 333,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 35,
                width: 150,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text(
                    'Chat',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Color(0xFF1877F2),
                ),
              ),
              Container(
                height: 35,
                width: 150,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text(
                    'Call',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Color(0xFF1877F2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
