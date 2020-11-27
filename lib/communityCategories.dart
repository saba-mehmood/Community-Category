import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:community_app/BottomBar.dart';
import 'community.dart';
import 'package:community_app/communitySubcategories.dart';

class CommunityCategories extends StatefulWidget {
  @override
  _CommunityCategoriesState createState() => _CommunityCategoriesState();
}

class _CommunityCategoriesState extends State<CommunityCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DockerButton(),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 5.0),
                color: Color(0xFFECECEC),
                height: 5.0),
            communityListViewBuilder(),
          ],
        ),
      ),
    );
  }
  PreferredSizeWidget appBar() {
    return AppBar(
      titleSpacing: -11.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        iconSize: 30,
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        onPressed: null,
      ),
      title: Container(
        margin: EdgeInsets.only(right: 28),
        height: 36.0,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(18.0),
            ),
            fillColor: Color(0xFF767680).withOpacity(0.12),
            filled: true,
            contentPadding: EdgeInsets.zero,
            isDense: true,
            hintText: "Search in Community",
            hintStyle: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 16,
              color: const Color(0xff6d6e70),
              height: 1.375,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.zero,
              child: Icon(Icons.search, size: 25.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget communityListViewBuilder(){
       return Expanded(
           child: NotificationListener<OverscrollIndicatorNotification>(
             child: Container(
               margin: EdgeInsets.fromLTRB(20, 29, 20, 0),
               child: ListView.separated(
                   separatorBuilder: (context, index) => Divider(
                     height: 45.0,
                     thickness: 0.2,
                     color: Color(0xFF6D6E70),
                   ),
                 itemCount: communityList.length,
                   itemBuilder: (context, int index) {
                     return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => CommunityCategoryPage(index)));
                      },
                       child: Container(
                         child: Text(communityList[index]['category'],
                             style: index == 0 ?
                                 TextStyle(
                                   fontFamily: 'Roboto-Bold',
                                   fontSize: 16,
                                   color: const Color(0xff1b1c1e),
                                   fontWeight: FontWeight.bold,
                                 )
                                 : TextStyle(
                             fontFamily: 'Roboto-Regular',
                             fontSize: 16,
                             color: const Color(0xFF6D6E70),
                       ),


                         ),
                       ),
                     );
                   },

               ),
             ),
           ),
       );
  }
}
