import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/stopwatch.dart';
import '../../model/user/user.dart';
import '../../model/user_view_model.dart';
import '../home/home_page.dart';
import 'image_picker/camera_widget.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(userProvider);
    final duration = ref.watch(timerProviderMin);
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
          Center(
            child: Container(
              height: 120,
              width: 120,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                //  color: Colors.grey.shade200,
                border: Border.all(width: 2, color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(100),
                image: user.profilePhoto != null
                    ? DecorationImage(
                        image: FileImage(
                          File(user.profilePhoto!),
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
                            //   user.profilePhoto = image?.path;
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                const Text('mshn',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Text(
                  'Bırakma tarihi\n21 Haziran 2022',
                  textAlign: TextAlign.center,
                )
              ],
            ),
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
