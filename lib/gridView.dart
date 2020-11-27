import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'InsideAdView.dart';

class GridViewLayout extends StatelessWidget {
  final String categoryName;
  final String subCategoryName;
  GridViewLayout(this.categoryName, this.subCategoryName);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              crossAxisCount: 2,
              crossAxisSpacing: 15),
          itemBuilder: (context, int index) {
            return Container(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommunityInsideAdView()),
                      );
                    },
                    child: Positioned(
                        height: 123,
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 123,
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset('assets/car.png')
                          ),
                        ),),
                  ),
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
                      child: Text('AED 500,000',
                          style: TextStyle(
                              color: Color(0xFF1877F2),
                              fontSize: 14,
                              fontFamily: 'Roboto'))),
                  Positioned(
                      top: 151,
                      height: 16,
                      left: 8,
                      child: Text(
                        'New Community',
                        style: TextStyle(fontSize: 12),
                      )),
                  Positioned(
                      top: 173,
                      height: 13,
                      left: 8,
                      child: Text(
                        categoryName + ' · ' + subCategoryName,
                        style:
                        TextStyle(color: Color(0xFF6D6E70), fontSize: 10),
                      )),
                  Positioned(
                      top: 193,
                      left: 8,
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
                      top: 193,
                      right: 8,
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
                      ))
                ],
              ),
            );
          }),
    );
  }
}
