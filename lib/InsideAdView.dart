import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'insideAdViewBottomBar.dart';
class CommunityInsideAdView extends StatefulWidget {
 // final String categoryName;
  //final String subCategoryName;

  // CommunityInsideAdView({ this.categoryName, this.subCategoryName});
  @override
  _CommunityInsideAdViewState createState() => _CommunityInsideAdViewState();
}

class _CommunityInsideAdViewState extends State<CommunityInsideAdView> {

  GoogleMapController mapController;
  final LatLng _center = const LatLng(33.6844, 73.0479);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
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
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: Image.asset(
                          'assets/car1.png',
                              height: 250,
                      ),
                    ),
                ),
                Positioned(
                  top: 21,
                  left: 17,
                  child: GestureDetector(
                    onTap: (){},
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
                    'Photo AND Video Services',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Roboto',
                        fontSize: 16),
                  ),
                ),
                Positioned(
                  top: 289 ,
                  left: 17,
                  child: Text(
                    'Events  >  Photo',
                    style: TextStyle(
                        color: Color(0xFF6D6E70),
                        fontFamily: 'Roboto',
                        fontSize: 10),
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
                          '5 days ago',
                          style: TextStyle(
                              fontSize: 10, color: Color(0xFF6D6E70)),
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
                  'UAE -  Abu Dhabi - City Center',
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
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    mapType: MapType.normal,
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
            height: 348,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                    top: 0.0,
                    height: 195,
                    left: 15,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18))),
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {},
                          itemCount: 1,
                          itemBuilder: (context, int index) {
                            return Image.asset('assets/car.png');
                          }),
                    )),
                Positioned(
                    top: 10,
                    width: 25,
                    height: 25,
                    right: 27,
                    child: SvgPicture.asset('assets/favoritesIcon.svg')),
                Positioned(
                    left: 24,
                    top: 172,
                    child: Text(
                      1.toString() + ' of ' + 1.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    )),
                Positioned(
                    top: 172,
                    width: MediaQuery.of(context).size.width,
                    height: 7,
                    child: Center(
                      child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, int index) {
                            return Container(
                              width: 11,
                              child: 1 - 1 == index
                                  ? SvgPicture.asset(
                                  'assets/pageIndicatorFilled.svg')
                                  : SvgPicture.asset(
                                  'assets/pageIndicator.svg'),
                            );
                          }),
                    )),
                Positioned(
                    top: 203.5,
                    height: 19,
                    left: 15,
                    width: 80,
                    child: Text('AED 500,000',
                        style: TextStyle(
                            color: Color(0xFF1877F2),
                            fontSize: 14,
                            fontFamily: 'Roboto'))),
                Positioned(
                    top: 206.5,
                    right: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/daysIcon.svg'),
                        SizedBox(width: 5.6),
                        Text(
                          '5 days ago',
                          style: TextStyle(
                              fontSize: 10, color: Color(0xFF6D6E70)),
                        )
                      ],
                    )),
                Positioned(
                    top: 225.5,
                    left: 15,
                    child: Text(
                      'New Services in the town',
                      style: TextStyle(
                          fontFamily: 'Roboto', color: Colors.black),
                    )),
                Positioned(
                    top: 247.5,
                    left: 15,
                    child: Text(
                      'Wedding' + ' · ' + 'Florists',
                      style: TextStyle(color: Color(0xFF6D6E70)),
                    )),
                // Positioned(
                //     left: 15,
                //     top: 270.5,
                //     child: Text(
                //       'Top Ad',
                //       style:
                //           TextStyle(color: Color(0xFF6D6E70), fontSize: 12),
                //     )),
                Positioned(
                    top: 280.5,
                    height: 13,
                    left: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/locationIcon.svg'),
                        SizedBox(width: 3.71),
                        Text(
                          'City Center',
                          style: TextStyle(
                              fontSize: 10, color: Color(0xFF6D6E70)),
                        )
                      ],
                    )),
                Positioned(
                    top: 302,
                    left: 15,
                    right: 15,
                    height: 0.2,
                    child: Container(
                      color: Color(0xFF6D6E70),
                    )),
                Positioned(
                    top: 309.5,
                    left: 15,
                    child: Container(
                      height: 0.2,
                      color: Color(0xFF6D6E70),
                    )),
                Positioned(
                    top: 309.5,
                    left: 33,
                    right: 33,
                    height: 28.5,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/profileIcon.svg'),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 79,
                                height: 24,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/callIcon.svg',
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Call',
                                      style: TextStyle(
                                          color: Color(0xFF1877F2),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1,
                                        color: Color(0xFF1877F2))),
                              ),
                              SizedBox(width: 10),
                              Container(
                                alignment: Alignment.center,
                                width: 79,
                                height: 24,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/ChatsIconFilled.svg',
                                      height: 12.83,
                                      width: 14,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Chat',
                                      style: TextStyle(
                                          color: Color(0xFF1877F2),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1,
                                        color: Color(0xFF1877F2))),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 9.5),
                Positioned(
                    top: 343,
                    height: 5,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Color(0xFFECECEC),
                    )),
              ],
            ),
          ),
          SizedBox(height: 17.5),
          //Safety Tips
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
              margin: EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text('• Never transfer money in advance')),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text('• Meet the seller at a public place.')),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text('• Avoid items with unrealistic prices.')),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text("• Don't proceed if something seems wrong"))
        ],
      ),
      ),
      ),

    );
  }
}
