import 'package:flutter/material.dart';
import '../../core/widget/util/show_overlay.dart';
import '../health/health_page.dart';

class DailyMoodSection extends StatefulWidget {
  const DailyMoodSection({
    Key? key,
  }) : super(key: key);

  @override
  State<DailyMoodSection> createState() => _DailyMoodSectionState();
}

class _DailyMoodSectionState extends State<DailyMoodSection> {
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.lightBlueAccent
  ];
  late LinearGradient gradient;
  List<Map<String, dynamic>> dailyStatus = [
    {'interval': "08:00\n12:00", "color": Colors.white},
    {'interval': "12:00\n16:00", "color": Colors.white},
    {'interval': "16:00\n20:00", "color": Colors.white},
    {'interval': "20:00\n24:00", "color": Colors.white}
  ];
  double moodVal = 5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gradient = LinearGradient(colors: colors);
  }

  setStatus(int i, int j) {
    dailyStatus[i]['color'] = colors[j];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(width: 2), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(dailyStatus.length, (i) {
          return Expanded(
            child: InkWell(
              onTap: () {
                Show.bottomSheet(
                  context,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: List.generate(
                      //     colors.length,
                      //     (j) {
                      //       return Expanded(
                      //         child: InkWell(
                      //           onTap: () {
                      //             dailyStatus[i]['color'] = colors[j];
                      //             setState(() {});
                      //           },
                      //           child: Container(
                      //             height: 56,
                      //             color: colors[j],
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      const SizedBox(height: 16),
                      const Text('How many times have you wanted to smoke?'),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [NumberPicker(onChanged: (val) {})],
                      ),
                      const SizedBox(height: 16),
                      const Text('How was your mood?'),
                      Row(
                        children: [
                          const Icon(Icons.mood_bad),
                          Expanded(child:
                              StatefulBuilder(builder: (context, setState) {
                            return SliderTheme(
                              data: SliderThemeData(
                                trackShape: GradientRectSliderTrackShape(
                                    gradient: gradient, darkenInactive: false),
                              ),
                              child: Slider(
                                  value: moodVal,
                                  activeColor: Colors.grey,
                                  thumbColor: Colors.blue,
                                  divisions: 4,
                                  min: 1,
                                  max: 5,
                                  onChanged: (val) {
                                    setStatus(i, val.toInt() - 1);

                                    moodVal = val;
                                    if (val > 1) {
                                      gradient = LinearGradient(
                                          colors: colors
                                              .take((val).toInt())
                                              .toList());
                                    }
                                    setState(() {});
                                  }),
                            );
                          })),
                          const Icon(Icons.mood),
                        ],
                      ),

                      const SizedBox(height: 16),

                      TextFormField(
                        maxLines: 5,
                        decoration: const InputDecoration(
                            hintText: 'Comments',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            )),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Save')),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
              child: Container(
                height: 56,
                color: dailyStatus[i]['color'],
                alignment: Alignment.center,
                child: Text(dailyStatus[i]['interval']),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  const GradientRectSliderTrackShape({
    this.gradient = const LinearGradient(
      colors: [
        Colors.red,
        Colors.yellow,
      ],
    ),
    this.darkenInactive = true,
  });

  final LinearGradient gradient;
  final bool darkenInactive;

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0);

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
            begin: sliderTheme.disabledInactiveTrackColor,
            end: sliderTheme.inactiveTrackColor)
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}

class NumberPicker extends StatelessWidget {
  const NumberPicker({Key? key, required this.onChanged}) : super(key: key);
  final ValueSetter<int> onChanged;

  @override
  Widget build(BuildContext context) {
    const double _kDefaultDiameterRatio = 1.07;
    const double _kDefaultPerspective = 0.003;
    const double _kSqueeze = 1.45;
    const double _kOverAndUnderCenterOpacity = 0.447;

    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        height: 128,
        width: 32,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 229, 234),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListWheelScrollView(
          controller: FixedExtentScrollController(initialItem: 0),
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: _kDefaultDiameterRatio,
          perspective: _kDefaultPerspective,
          magnification: 1.2,
          squeeze: _kSqueeze,
          overAndUnderCenterOpacity: _kOverAndUnderCenterOpacity,
          itemExtent: 40,
          children: [
            for (var i = 0; i < 50; i++)
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  '$i',
                  textScaleFactor: 1.6,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              ),
          ],
          onSelectedItemChanged: onChanged,
        ),
      ),
    );
  }
}
