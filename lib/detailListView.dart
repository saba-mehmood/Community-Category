import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'InsideAdView.dart';

class DetailListViewLayout extends StatefulWidget {
  final String categoryName;
  final String subCategoryName;
  DetailListViewLayout(this.categoryName, this.subCategoryName);
  @override
  _DetailListViewLayoutState createState() => _DetailListViewLayoutState();
}

class _DetailListViewLayoutState extends State<DetailListViewLayout> {
  int totalImageCount = 8;
  int currentImage = 1;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, int index) {
              return Container(
                height: 380.0,
                child: Stack(
                  children: [
                    Positioned(
                        top: 15.0,
                        height: 195,
                        left: 15,
                        right: 15,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18))),
                          child: PageView.builder(
                              controller: _pageController,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (value) {
                                setState(() {
                                  currentImage = value + 1;
                                });
                              },
                              itemCount: totalImageCount,
                              itemBuilder: (context, int index) {
                                return Image.asset('assets/car.png');
                              }),
                        )),
                    Positioned(
                        top: 25,
                        width: 25,
                        height: 25,
                        right: 27,
                        child: SvgPicture.asset('assets/favoritesIcon.svg')),
                    Positioned(
                        left: 24,
                        top: 187,
                        child: Text(
                          currentImage.toString() +
                              ' of ' +
                              totalImageCount.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        )),
                    Positioned(
                        top: 187,
                        width: MediaQuery.of(context).size.width,
                        height: 7,
                        child: Center(
                          child: ListView.builder(
                              primary: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: totalImageCount,
                              itemBuilder: (context, int index) {
                                return Container(
                                  width: 11,
                                  child: currentImage - 1 == index
                                      ? SvgPicture.asset(
                                      'assets/pageIndicatorFilled.svg')
                                      : SvgPicture.asset(
                                      'assets/pageIndicator.svg'),
                                );
                              }),
                        )),
                    Positioned(
                        top: 218.5,
                        height: 19,
                        left: 15,
                        width: 80,
                        child: Text('AED 500,000',
                            style: TextStyle(
                                color: Color(0xFF1877F2),
                                fontSize: 14,
                                fontFamily: 'Roboto'))),
                    Positioned(
                        top: 221.5,
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
                        top: 240.5,
                        left: 15,
                        child: Text(
                          'New Services in the town',
                          style: TextStyle(
                              fontFamily: 'Roboto', color: Colors.black),
                        )),
                    Positioned(
                        top: 262.5,
                        left: 15,
                        child: Text(
                          widget.categoryName + ' · ' + widget.subCategoryName,
                          style: TextStyle(color: Color(0xFF6D6E70)),
                        )),
                    Positioned(
                        left: 15,
                        top: 285.5,
                        child: Text(
                          'Top Ad',
                          style:
                          TextStyle(color: Color(0xFF6D6E70), fontSize: 12),
                        )),
                    Positioned(
                        top: 312.5,
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
                        top: 334,
                        left: 15,
                        right: 15,
                        height: 0.2,
                        child: Container(
                          color: Color(0xFF6D6E70),
                        )),
                    Positioned(
                        top: 341.5,
                        left: 15,
                        child: Container(
                          height: 0.2,
                          color: Color(0xFF6D6E70),
                        )),
                    Positioned(
                        top: 342.5,
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
                        top: 375,
                        height: 5,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          color: Color(0xFFECECEC),
                        ))
                  ],
                ),
              );
            }));
  }
}
