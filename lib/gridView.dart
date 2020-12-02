import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'InsideAdView.dart';
import 'Controllers/communityAdList.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridViewLayout extends StatefulWidget {
  final String categoryName;
  final String subCategoryName;
  GridViewLayout(this.categoryName, this.subCategoryName);

  @override
  _GridViewLayoutState createState() => _GridViewLayoutState();
}

class _GridViewLayoutState extends State<GridViewLayout> {
 CommunityAdListController _communityAdListController = Get.find();

  int totalImageCount = 6;
  int currentImage = 0;
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
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                childAspectRatio: 0.85,
                crossAxisCount: 2,
                crossAxisSpacing: 15),
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
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(
                          height: 123,
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 123,
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
                          top: 110,
                          height: 7,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
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
                          top: 6,
                          right: 6,
                          child: SvgPicture.asset(
                            'assets/favoritesIcon.svg',
                            width: 20,
                            height: 20,
                          )),
                      Positioned(
                          top: 127,
                          height: 19,
                          left: 8,
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
                          top: 151,
                          height: 16,
                          left: 8,
                          child: Text(
                            _communityAdListController
                                .allCommunityList[index].Title,
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 12),
                          )),
                      Positioned(
                          top: 173,
                          height: 13,
                          left: 8,
                          child: Text(
                            widget.categoryName +
                                ' · ' +
                                widget.subCategoryName,
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                color: Color(0xFF6D6E70),
                                fontSize: 10),
                          )),
                      Positioned(
                          top: 193,
                          left: 8,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/locationIcon.svg',
                                width: 5.33,
                                height: 8,
                              ),
                              SizedBox(width: 3.71),
                              Text(
                                _communityAdListController
                                    .allCommunityList[index]
                                    .Location,
                                style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 8,
                                    color: Color(0xFF6D6E70)),
                              )
                            ],
                          )),
                      Positioned(
                          top: 193,
                          right: 8,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/daysIcon.svg',
                                width: 8.2,
                                height: 8.2,
                              ),
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
                                    fontSize: 8,
                                    color: Color(0xFF6D6E70)),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
