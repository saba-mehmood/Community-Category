import 'package:community_app/Controllers/communityAdList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'InsideAdView.dart';

class BriefListLayoutView extends StatefulWidget {
  final String categoryName;
  final String subCategoryName;
  BriefListLayoutView(this.categoryName, this.subCategoryName);

  @override
  _BriefListLayoutViewState createState() => _BriefListLayoutViewState();
}

class _BriefListLayoutViewState extends State<BriefListLayoutView> {
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
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount:
              _communityAdListController.allCommunityList.length,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityInsideAdView(index))),
                  child: Container(
                      height: 115,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              left: 0,
                              width: 134,
                              height: 115,
                              child: PageView.builder(
                                  controller: PageController(
                                      initialPage:
                                      _communityAdListController
                                          .allCommunityList[index]
                                          .CurrentIndex
                                          .value),
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
                                          bottomLeft:
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
                                  })),
                          Positioned(
                              top: 5,
                              left: 110,
                              child: SvgPicture.asset(
                                'assets/favoritesIcon.svg',
                                width: 18,
                                height: 18,
                              )),
                          Positioned(
                              top: 100,
                              left: 50,
                              width: MediaQuery.of(context).size.width,
                              height: 7,
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
                                  })),
                          Positioned(
                            left: 150,
                            top: 0,
                            right: 0,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  height: 19,
                                  child: Text(
                                      'AED ' +
                                          _communityAdListController
                                              .allCommunityList[index]
                                              .Price
                                              .toString(),
                                      style: TextStyle(
                                          color: Color(0xFF1877F2),
                                          fontSize: 14,
                                          fontFamily: 'Roboto-Medium')),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  height: 16,
                                  child: Text(
                                    _communityAdListController
                                        .allCommunityList[index].Title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Roboto-Medium'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 16,
                                  child: Text(
                                    widget.categoryName +
                                        ' · ' +
                                        widget.subCategoryName,
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        color: Color(0xFF6D6E70),
                                        fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
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
                                                .allCommunityList[
                                            index]
                                                .Location,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily:
                                                'Roboto-Regular',
                                                color:
                                                Color(0xFF6D6E70)),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/daysIcon.svg'),
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
                                                fontSize: 10,
                                                fontFamily:
                                                'Roboto-Regular',
                                                color:
                                                Color(0xFF6D6E70)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                );
              }));
    });
  }
}
