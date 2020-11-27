import 'package:community_app/Controllers/filterController.dart';
import 'package:community_app/Controllers/communityAdList.dart';
import 'package:community_app/filterOptionSelector.dart';
import 'package:community_app/community.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommunityFilterDesign extends StatelessWidget {
  final FilterController _filterController = Get.find();
  final CommunityAdListController _communityAdListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Filters",
          style: TextStyle(
              fontSize: 28.0, fontFamily: 'Roboto', color: Color(0xFF1877F2)),
        ),
        leading: Container(
          width: 8.25,
          height: 14.44,
          margin: EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                "Reset",
                style: TextStyle(
                    color: Colors.black, fontSize: 16.0, fontFamily: 'Roboto'),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final newLocationValue = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Location', _filterController.allLocationsList)));
                if (newLocationValue != null) {
                  _filterController.location.value = newLocationValue;
                }
                _communityAdListController.fetchDataWithFilter();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(child: Obx(() {
                            return Text(_filterController.location.value,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0));
                          })),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                final newSearchInLocation = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Search In', _filterController.allSearchInList)));
                if (newSearchInLocation != null) {
                  _filterController.searchIn.value = newSearchInLocation;
                }
                _communityAdListController.fetchDataWithFilter();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search In",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(child: Obx(() {
                            return Text(_filterController.searchIn.value,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0));
                          })),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                communityList.forEach((element) {
                  _filterController.allCategoryList.add(element['category']);
                });
                final newCategoryValue = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Category', _filterController.allCategoryList)));
                if (newCategoryValue != null) {
                  _filterController.category.value = newCategoryValue;
                }
                _communityAdListController.fetchDataWithoutFilter();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          "Category",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          FittedBox(child: Obx(() {
                            return Text(_filterController.category.value,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0));
                          })),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                _filterController.allSubCategoryList.clear();
                communityList.forEach((element) {
                  if (element['category'] == _filterController.category.value) {
                    _filterController.allSubCategoryList
                        .addAll(element['subcategory']);
                  }
                  // _servicesAdListController.fetchDataWithFilter();
                });
                final newSubCategoryValue = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Sub Category',
                            _filterController.allSubCategoryList)));
                if (newSubCategoryValue != null) {
                  _filterController.subCategory.value = newSubCategoryValue;
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Category",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(child: Obx(() {
                            return Text(_filterController.subCategory.value,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0));
                          })),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),

            GestureDetector(
              onTap: () async {
                final newAdLanguage = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Ad Language',
                            _filterController.allLangaugeAvailable)));
                if (newAdLanguage != null) {
                  _filterController.adLanguage.value = newAdLanguage;
                }
                _communityAdListController.fetchDataWithFilter();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ad Langauge",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(child: Obx(() {
                            return Text(_filterController.adLanguage.value,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0));
                          })),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                final newOfferType = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Offer Type', _filterController.allOfferType)));
                if (newOfferType != null) {
                  _filterController.offerType.value = newOfferType;
                }
                _communityAdListController.fetchDataWithFilter();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Offer Type",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(child: Obx(() {
                            return Text(_filterController.offerType.value,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0));
                          })),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ads posted",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () {
                _filterController.showPhotosOnlyAd.value =
                    !_filterController.showPhotosOnlyAd.value;
                _communityAdListController.fetchDataWithFilter();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show ads with photos only",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(() {
                        return _filterController.showPhotosOnlyAd.value == true
                            ? Container(
                                width: 16.0,
                                height: 16.0,
                                child: SvgPicture.asset('assets/checkBox.svg'))
                            : Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: Color(0xFF6D6E70), width: 1.5)),
                              );
                      })
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () {
                _filterController.showPromotedAdOnly.value =
                    !_filterController.showPromotedAdOnly.value;
                _communityAdListController.fetchDataWithFilter();
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show promoted ads only",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(() {
                        return _filterController.showPromotedAdOnly.value ==
                                true
                            ? Container(
                                width: 16.0,
                                height: 16.0,
                                child: SvgPicture.asset('assets/checkBox.svg'))
                            : Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: Color(0xFF6D6E70), width: 1.5)),
                              );
                      })
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Keyword",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              height: 51.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(fontSize: 16.0, color: Color(0xFF6D6E70)),
                    hintText: "Search Keywords"),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            SizedBox(height: 60.0)
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.transparent.withAlpha(0),
        onClosing: () {},
        builder: (context) {
          return GestureDetector(
            onTap: () {
              // ignore: deprecated_member_use, invalid_use_of_protected_member
              _communityAdListController.allCommunityList.value =
                  _communityAdListController.filteredCommunityList;
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 4.0),
              height: 51.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF1877F2)),
              child: Obx(() {
                return Text(
                  "Show " +
                      _communityAdListController.filteredCommunityList.length
                          .toString() +
                      " Results",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
