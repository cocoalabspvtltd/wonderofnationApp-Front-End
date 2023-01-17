

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoUpload extends StatefulWidget {
const VideoUpload({Key? key}) : super(key: key);

@override
State<VideoUpload> createState() => _VideoUploadState();
}

class _VideoUploadState extends State<VideoUpload> {
  @override
  File? _video;
  final picker =ImagePicker();
  VideoPlayerController? _videoPlayerController;

  Widget build(BuildContext context) {
    return Scaffold(

      body:
      SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30,),
              if(_video != null)
                _videoPlayerController!.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController!,),
                )
                    : Container()
              else
                GestureDetector(
                  onTap: () {
                    _pickVideo();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Text("Choose video",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                  ),
                ),
            ],
          ),
        ),


    );
  }
  _pickVideo() async {
    PickedFile? pickedFile = await picker.getVideo(source: ImageSource.gallery);
    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)..initialize().then((_) {
      setState(() { });
      _videoPlayerController!.play();
      print("_videopath->>>>>>>>>>>>${_video!.path}");
    });
  }
}
