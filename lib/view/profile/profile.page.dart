import 'dart:io';

import 'package:flutter/material.dart';

import 'image_picker/camera_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Profile'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 120,
              width: 120,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(100),
                image: photoUrl != null
                    ? DecorationImage(
                        image: FileImage(
                          File(photoUrl!),
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: FloatingActionButton(
                mini: true,
                elevation: 0,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.add_a_photo,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        //  return GalleryPicker();
                        return CameraWidget(
                          onImagePicked: (image) {
                            photoUrl = image?.path;
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
