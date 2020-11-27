import 'package:community_app/Controllers/filterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterOptionsSelector extends StatelessWidget {
  final String title;
  final RxList options;
  FilterOptionsSelector(this.title, this.options);

  final FilterController _filterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context),
        body: Column(
          children: [
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFECECEC),
            ),
            SizedBox(height: 23),
            _listViewBuilder()
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar(context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(63),
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                  )),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF1877F2),
                      fontSize: 28,
                      fontFamily: 'Roboto'),
                ),
              ),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                  )),
            ],
          ),
        ));
  }

  Widget _listViewBuilder() {
    return Expanded(
      child: ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, options[index]);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 51,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 23),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF6D6E70), width: 0.5),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Text(
                          options[index],
                          style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                        );
                      }),
                      options[index] != '_currentSelectedString'
                          ? Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                      color: Color(0xFF6D6E70), width: 1.5)),
                            )
                          : Container(
                              width: 16.0,
                              height: 16.0,
                              child: SvgPicture.asset('assets/checkBox.svg'))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
