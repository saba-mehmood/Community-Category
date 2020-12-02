import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'InsideAdView.dart';
import 'Controllers/communityAdList.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailListViewLayout extends StatefulWidget {
  final String categoryName;
  final String subCategoryName;
  DetailListViewLayout(this.categoryName, this.subCategoryName);
  @override
  _DetailListViewLayoutState createState() => _DetailListViewLayoutState();
}

class _DetailListViewLayoutState extends State<DetailListViewLayout> {
  CommunityAdListController _communityAdListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _communityAdListController.isDataLoading.value == true
          ? Center(child: CircularProgressIndicator())
          : _communityAdListController.isDataLoading.value == false &&
          _communityAdListController.allCommunityList.length == 0
          ? Center(
          child: Text(
            'No Ads to Show !',
            style: TextStyle(
              fontFamily: 'Roboto-Medium',
              color: Color(0xFF6D6E70),
            ),
          ))
          : Container(
          child: ListView.builder(
              itemCount:
              _communityAdListController.allCommunityList.length,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CommunityInsideAdView(index))),
                  child: Container(
                    height: 384.0,
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
                                  controller: PageController(
                                      initialPage:
                                      _communityAdListController
                                          .allCommunityList[index]
                                          .CurrentIndex
                                          .value),
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (value) {
                                    _communityAdListController
                                        .allCommunityList[index]
                                        .CurrentIndex
                                        .value = value;
                                  },
                                  itemCount: _communityAdListController
                                      .allCommunityList[index]
                                      .Images
                                      .length,
                                  itemBuilder: (context, int index1) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight:
                                          Radius.circular(12)),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl:
                                          'https://firebasestorage.googleapis.com/v0/b/elistad-d9339.appspot.com/o/Classified%2F' +
                                              _communityAdListController
                                                  .allCommunityList[
                                              index]
                                                  .Images[index1] +
                                              '.jpg?alt=media'),
                                    );
                                  }),
                            )),
                        Positioned(
                            top: 25,
                            width: 25,
                            height: 25,
                            right: 27,
                            child: SvgPicture.asset(
                                'assets/favoritesIcon.svg')),
                        Positioned(
                            left: 24,
                            top: 187,
                            child: Obx(() {
                              return Text(
                                (_communityAdListController
                                    .allCommunityList[
                                index]
                                    .CurrentIndex
                                    .value +
                                    1)
                                    .toString() +
                                    ' of ' +
                                    _communityAdListController
                                        .allCommunityList[index]
                                        .Images
                                        .length
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 8),
                              );
                            })),
                        Positioned(
                            top: 187,
                            width: MediaQuery.of(context).size.width,
                            height: 7,
                            child: Center(
                              child: ListView.builder(
                                  primary: true,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _communityAdListController
                                      .allCommunityList[index]
                                      .Images
                                      .length,
                                  itemBuilder: (context, int index1) {
                                    return Obx(() {
                                      return Container(
                                        width: 11,
                                        child: _communityAdListController
                                            .allCommunityList[
                                        index]
                                            .CurrentIndex
                                            .value ==
                                            index1
                                            ? SvgPicture.asset(
                                            'assets/pageIndicatorFilled.svg')
                                            : SvgPicture.asset(
                                            'assets/pageIndicator.svg'),
                                      );
                                    });
                                  }),
                            )),
                        Positioned(
                            top: 218.5,
                            height: 19,
                            left: 15,
                            child: Text(
                                'AED ' +
                                    _communityAdListController
                                        .allCommunityList[index].Price
                                        .toString(),
                                style: TextStyle(
                                    color: Color(0xFF1877F2),
                                    fontSize: 14,
                                    fontFamily: 'Roboto-Medium'))),
                        Positioned(
                            top: 221.5,
                            right: 15,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/daysIcon.svg'),
                                SizedBox(width: 5.6),
                                Text(
                                  ((DateTime.now().millisecondsSinceEpoch -
                                      _communityAdListController
                                          .allCommunityList[
                                      index]
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
                            top: 240.5,
                            left: 15,
                            child: Text(
                              _communityAdListController
                                  .allCommunityList[index].Title,
                              style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: Colors.black),
                            )),
                        Positioned(
                            top: 262.5,
                            left: 15,
                            child: Text(
                              widget.categoryName +
                                  ' · ' +
                                  widget.subCategoryName,
                              style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  color: Color(0xFF6D6E70)),
                            )),
                        Positioned(
                            left: 15,
                            top: 285.5,
                            child: Text(
                              'Top Ad',
                              style: TextStyle(
                                  fontFamily: 'Roboto-Regular',
                                  color: Color(0xFF6D6E70),
                                  fontSize: 12),
                            )),
                        Positioned(
                            top: 312.5,
                            height: 13,
                            left: 15,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/locationIcon.svg'),
                                SizedBox(width: 3.71),
                                Text(
                                  _communityAdListController
                                      .allCommunityList[index]
                                      .Location,
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 10,
                                      color: Color(0xFF6D6E70)),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                      'assets/profileIcon.svg'),
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
                                                  color:
                                                  Color(0xFF1877F2),
                                                  fontFamily:
                                                  'Roboto-Bold',
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                12),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                Color(0xFF1877F2))),
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
                                                  fontFamily:
                                                  'Roboto-Bold',
                                                  color:
                                                  Color(0xFF1877F2),
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                12),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                Color(0xFF1877F2))),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                        // SizedBox(height: 8),
                        Positioned(
                            top: 379,
                            height: 5,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              color: Color(0xFFECECEC),
                            ))
                      ],
                    ),
                  ),
                );
              }));
    });
  }
}

