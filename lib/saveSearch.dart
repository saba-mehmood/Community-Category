import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SaveSearch extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<SaveSearch> {
  List<String> _data = ['list data'];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF6D6E70),
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text('Saved')
                  .text
                  .size(28)
                  .fontFamily('Roboto')
                  .medium
                  .center
                  .hexColor('#1877F2')
                  .makeCentered(),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  _clearAllItems();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text("Delete All")
                      .text
                      .size(16)
                      .medium
                      .fontFamily('Roboto')
                      .hexColor('#000000')
                      .makeCentered(),
                ),
              ),
            ],
            bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              onTap: (index) {},
              tabs: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                      color: Color(0xFF6D6E70),
                      width: 0.3,
                    )),
                  ),
                  child: Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bookmark_sharp,
                            color: Colors.black, size: 19),
                        WidthBox(4),
                        Text('Searches')
                            .text
                            .center
                            .medium
                            .fontFamily('Roboto')
                            .size(16)
                            .hexColor('#000000')
                            .makeCentered(),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                      color: Color(0xFF6D6E70),
                      width: 0.3,
                    )),
                  ),
                  child: Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Container(

                        Icon(Icons.bookmark_sharp,
                            color: Colors.black, size: 19),

                        WidthBox(4),

                        Text('Ads')
                            .text
                            .center
                            .medium
                            .fontFamily('Roboto')
                            .size(16)
                            .hexColor('#000000')
                            .makeCentered(),
                      ],
                    ),
                  ),
                ),
              ],
              indicatorColor: Color(0xFF1877F2),
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('Saved Search List'),
              ),
              Center(
                child: Text('Saved Ads List'),
              )
            ],
          ),
        ),
      ),
    );
  }

  //This method is used in 'Delete All' widget
  void _clearAllItems() {
    _data.clear();
    // _listKey.currentState.clear();
  }
}
