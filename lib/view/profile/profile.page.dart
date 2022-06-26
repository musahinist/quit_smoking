import 'dart:io';

import 'package:flutter/material.dart';

import '../home/home_page.dart';
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
        title: const Text('Profile'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          Row(
            children: [
              Container(
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
              const SizedBox(width: 24),
              Expanded(
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      const Text('mshn',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const Text('Bırakma tarihi: 21 Haziram 2022')
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("${duration.inDays}",
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold)),
                          const Text('days')
                        ],
                      ),
                      Column(
                        children: [
                          Text("${duration.inHours.remainder(24)}",
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold)),
                          const Text('hours')
                        ],
                      ),
                      Column(
                        children: [
                          Text("${duration.inMinutes.remainder(60)}",
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold)),
                          const Text('minutes')
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.smoke_free,
                            size: 36,
                            color: Colors.green,
                          ),
                          Text(
                              (duration.inHours * (20 / 24)).toStringAsFixed(0),
                              style: Theme.of(context).textTheme.headline5),
                          const Text('içilmeyen\nsigara',
                              textAlign: TextAlign.center)
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.monetization_on_outlined,
                            size: 36,
                            color: Colors.green,
                          ),
                          Text(
                              "₺${(duration.inHours * (25 / 24)).toStringAsFixed(0)}",
                              style: Theme.of(context).textTheme.headline5),
                          const Text('kurtarılan\npara',
                              textAlign: TextAlign.center)
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 36,
                            color: Colors.green,
                          ),
                          Text("${(duration.inHours / 12).toStringAsFixed(0)}s",
                              style: Theme.of(context).textTheme.headline5),
                          const Text('geri\nkazanıldı',
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(onPressed: () {}, child: const Text('Paylaş'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
