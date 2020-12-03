
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:velocity_x/velocity_x.dart';



class Test extends StatefulWidget {


  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
int lastIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 340,
                child: Stack(
                  children: [
                    Positioned(top: 0,
                      left: 0,
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:lastIndex,
                          itemBuilder: (context, int index1) {
                           //// if(index1 == List.length - 1){
                            if(index1 < lastIndex -1){
                            return  Container(
                              child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/community-test-2cde2.appspot.com/o/pexels-photo-2486168.jpeg?alt=media&token=77a458f3-c537-41d5-ba4c-e56e6a879acd'
                              ),
                            );

                            }else {
                              return Stack(
                                children: [
                                  Positioned(
                                      height: 250,
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 123,
                                        child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.asset('assets/car1.png')),
                                      )),
                                  Positioned(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(105.0),
                                        child: RaisedButton(
                                         // color: Colors.black54,
                                          onPressed: (){},
                                          child: Text('View All').text.makeCentered(),
                                        ),
                                      )
                                  ),
                                  )
                                ],
                                
                              );
                            }


                            // Stack(
                            // children: [
                            //   Positioned(
                            //     left: 0,
                            //     right: 0,
                            //       child:CachedNetworkImage(
                            //           fit: BoxFit.fill,
                            //           imageUrl: 'https://firebasestorage.googleapis.com/v0/b/community-test-2cde2.appspot.com/o/pexels-photo-2486168.jpeg?alt=media&token=77a458f3-c537-41d5-ba4c-e56e6a879acd'
                            //       ),
                            //   ),
                            //   Positioned(
                            //     top:90,
                            //     left: 100,
                            //     right: 100,
                            //     child: RaisedButton(
                            //       onPressed: (){},
                            //       child: Text('View All').text.makeCentered(),

                            //     ),
                            //   ),
                            // ],);
                          },
                        ),
                      ),
                    )
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
  }
}




