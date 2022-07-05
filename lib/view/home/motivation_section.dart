import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_view_model.dart';
import '../motivation/motivation_page.dart';

class MotivationSection extends StatefulWidget {
  const MotivationSection({Key? key, required this.reasonList})
      : super(key: key);
  final List<String> reasonList;

  @override
  State<MotivationSection> createState() => _MotivationSectionState();
}

class _MotivationSectionState extends State<MotivationSection>
    with TickerProviderStateMixin {
  TabController? _tabController;
  late final Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: widget.reasonList.length, vsync: this);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _tabController!.animateTo(
        (_tabController!.index + 1) % widget.reasonList.length,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    //  WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void didUpdateWidget(covariant MotivationSection oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _tabController!.dispose();
    _tabController = null;
    _tabController =
        TabController(length: widget.reasonList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
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
                  widget.reasonList.length,
                  (i) => Center(
                    child: Text(
                      widget.reasonList[i],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            TabPageSelector(
              indicatorSize: 8,
              controller: _tabController,
              selectedColor: Colors.lightBlue,
            )
          ],
        ),
      ),
    );
  }
}
