import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constant.dart';
import '../motivation/motivation_page.dart';

class MotivationSection extends StatefulWidget {
  const MotivationSection({
    Key? key,
  }) : super(key: key);

  @override
  State<MotivationSection> createState() => _MotivationSectionState();
}

class _MotivationSectionState extends State<MotivationSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final Timer _timer;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: Constant.reasonList.length, vsync: this);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _tabController.animateTo(
        (_tabController.index + 1) % Constant.reasonList.length,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const MotivationPage()));
      },
      child: Container(
        height: 90,
        width: double.infinity,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                      Constant.reasonList.length,
                      (i) => Center(
                              child: Text(
                            Constant.reasonList[i],
                            textAlign: TextAlign.center,
                          )))),
            ),
            TabPageSelector(
              indicatorSize: 8,
              controller: _tabController,
              selectedColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
