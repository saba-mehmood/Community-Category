import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FilterForm extends StatefulWidget {
  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF000000),
            size: 19,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 195),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CupertinoButton(
                    color: Color(0xFF1877F2),
                    //disabledColor: Colors.white60,
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      height: 25,
                      child: Text('Sort by')
                          .text
                          .size(13)
                          .fontFamily('SF Pro Text')
                          .center
                          .semiBold
                          .hexColor('#8F8F8F')
                          .makeCentered(),
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      final act = SortByWidget();
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) => act);
                    },
                  ),
                ),
                //cancel Button
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class SortByWidget extends StatelessWidget {
  const SortByWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
        actions: [
          RefactorSheet(
            label: ('Newest to Oldest'),
            onPress: () {},
          ),
          RefactorSheet(
            label: ('Oldest to Newest'),
            onPress: () {},
          ),
        ],

        //cancel Button
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel')
              .text
              .size(20)
              .semiBold
              .fontFamily('SF Pro Text')
              .center
              .hexColor('#1877F2')
              .makeCentered(),
        ));
  }
}

class RefactorSheet extends StatelessWidget {
  RefactorSheet({@required this.label, this.onPress});
  final Function onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: CupertinoActionSheetAction(
        onPressed: onPress,
        child: Text(label)
            .text
            .size(20)
            .fontFamily('SF Pro Text')
            .center
            .hexColor('#1877F2')
            .makeCentered(),
      ),
    );
  }
}
