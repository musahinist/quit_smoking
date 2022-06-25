import 'dart:async';
import 'dart:io';

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ImageCropper extends StatefulWidget {
  const ImageCropper({Key? key, required this.image}) : super(key: key);

  final Uint8List image;

  @override
  _ImageCropperState createState() => _ImageCropperState();
}

class _ImageCropperState extends State<ImageCropper> {
  late ui.Image image;
  bool isImageloaded = false;
  @override
  void initState() {
    super.initState();
    init(widget.image);
  }

  Future<void> init(Uint8List data) async {
    // final ByteData data = await rootBundle.load(path);
    image = await loadImage(data);
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img as Uint8List, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  Widget _buildImage() {
    if (isImageloaded) {
      return CustomPaint(
        painter: PngImagePainter(image: image),
      );
    } else {
      return const Center(child: Text('loading'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox.expand(
        child: _buildImage(),
      ),
    ));
  }
}

class PngImagePainter extends CustomPainter {
  PngImagePainter({
    required this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    _drawCanvas(size, canvas);
    _saveCanvas(size);
  }

  Canvas _drawCanvas(Size size, Canvas canvas) {
    // final center = Offset(size.width / 2, size.height / 2);
    // final radius = math.min(size.width, size.height) / 8;
    final paint = Paint();
    paint.color = Colors.black.withOpacity(0.5);

    // The circle should be paint before or it will be hidden by the path
    // Paint paintCircle = Paint()
    //   ..color = Colors.red
    //   ..style = PaintingStyle.fill;
    // Paint paintBorder = Paint()
    //   ..color = Colors.pink
    //   ..strokeWidth = 4
    //   ..style = PaintingStyle.stroke;

    double drawImageWidth = 0;
    var drawImageHeight = 0.0; //-size.height * 0.8;

    Path path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2));
    //  canvas.clipPath(path);
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(drawImageWidth, drawImageHeight, image.width.toDouble(),
          image.height.toDouble()),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromLTRBR(
              0, 0, size.width, size.height, const Radius.circular(0))),
        path..close(),
      ),
      paint,
    );
    //  canvas.drawCircle(center, radius, paintBorder);
    // canvas.drawCircle(center, radius, paintCircle);

    // canvas.save();
    // canvas.restore();
    return canvas;
  }

  _saveCanvas(Size size) async {
    var pictureRecorder = ui.PictureRecorder();
    var canvas = Canvas(
        pictureRecorder,
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2));
    var paint = Paint();
    paint.isAntiAlias = true;

    _drawCanvas(size, canvas);

    var pic = pictureRecorder.endRecording();

    ui.Image img = await pic.toImage(size.width.toInt(), size.height.toInt());
    var byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    var buffer = byteData!.buffer.asUint8List();

    // var response = await get(imgUrl);
    // var documentDirectory = await getApplicationDocumentsDirectory();
    // File file = File(join(documentDirectory.path,
    //     '${DateTime.now().toUtc().toIso8601String()}.png'));
    // file.writeAsBytesSync(buffer);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
