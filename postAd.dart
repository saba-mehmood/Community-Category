import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';
import 'package:dotted_border/dotted_border.dart';



class PostAdForm extends StatefulWidget {

  @override
  _PostAdFormState createState() => _PostAdFormState();
}

class _PostAdFormState extends State<PostAdForm> {

  PickedFile _image;
  File _video;
  File _cameraVideo;

  ImagePicker picker = ImagePicker();
  VideoPlayerController _videoPlayerController;
  VideoPlayerController _cameraVideoPlayerController;

  // This funcion will helps you to pick a Image File from Camera
  _imgFromCamera() async {
    PickedFile image = await ImagePicker().getImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

// This funcion will helps you to pick a Image File from Gallery
  _imgFromGallery() async {
    PickedFile image = await ImagePicker().getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  //pick video

  // This funcion will helps you to pick a Video File from Gallery
  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
    if (_cameraVideo != null)
      _cameraVideoPlayerController.value.initialized
          ? AspectRatio(
        aspectRatio:
        _cameraVideoPlayerController.value.aspectRatio,
        child: VideoPlayer(_cameraVideoPlayerController),
      )
          : Container(
        height:80,
        width:80,
      );
    else
      Text(
        "Click on Pick Video to select video",
        style: TextStyle(fontSize: 18.0),
      );

  }

  // This funcion will helps you to pick a Video File from Camera
  _pickVideoFromCamera() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.camera);

    _cameraVideo = File(pickedFile.path);

    _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo)
      ..initialize().then((_) {
        setState(() {});
        _cameraVideoPlayerController.play();
      });
 // if (_video != null)
 //   _videoPlayerController.value.initialized
 //       ? AspectRatio(
 //     aspectRatio: _videoPlayerController.value.aspectRatio,
 //     child: VideoPlayer(_videoPlayerController),
 //   )
 //       : Container(
 //       height:80,
 //       width:80,
 //   );
 // else
 //   Text(
 //     "Click on Pick Video to select video",
 //     style: TextStyle(fontSize: 18.0),
 //   );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Select Image'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Capture Image'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.motion_photos_on),
                    title: new Text('Record Video'),
                    onTap: () {
                      _pickVideoFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('select Video'),
                    onTap: () {
                      _pickVideo();
                      Navigator.of(context).pop();
                    },

                  ),


                ],
              ),
            ),
          );

        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Post an Ad",
          style: TextStyle(
              fontSize: 28.0, fontFamily: 'Roboto', color: Color(0x6D6E70)),
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
        actions: [
          Container(
            width: 8.25,
            height: 14.44,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
                icon: Icon(
                  Icons.cancel,
                ),
              ),),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            HeightBox(10.0),
            Center(
              child: Container(
                height:90.0,
                width:335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:Colors.black12,
                ),
                child: DottedBorder(
                  dashPattern: [8,4],
                  //borderType: Radius.circular(5.00),
                  color:Colors.black26.withAlpha(80),
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(5),
                   // strokeCap: StrokeCap.round,
                    //(0x6D6E70),
                  child: Column(
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () async{
                            _showPicker(context);
                          },

                          child:  Column(
                            children: [
                              HeightBox(10),
                              Container(
                                  width: 37.52,
                                  height: 33.22,
                                  child: SvgPicture.asset('assets/photo.svg')),
                              HeightBox(5.0),
                              Text('Add or Take Photos/videos')
                                  .text
                                  .size(16)
                                  .fontFamily('Roboto')
                                  .medium
                                  .color(Color(0xFF1877F2),)
                                  .makeCentered(),
                            ],
                          ),
                        ),

                      ),

                    ],
                  ),
                ),
              ),


            ),
            HeightBox(5.0),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(

                        image: _image == null
                            ? AssetImage('assets/car.png')
                            :FileImage(File(_image.path,
                        )),
                        fit: BoxFit.cover,
                      )),

                ),


              ],
            ),

          ],
        ),
      ),
    );
  }
}
