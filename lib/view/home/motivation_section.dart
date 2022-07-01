import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_view_model.dart';
import '../motivation/motivation_page.dart';

class MotivationSection extends ConsumerStatefulWidget {
  const MotivationSection({
    Key? key,
  }) : super(key: key);

  @override
  MotivationSectionState createState() => MotivationSectionState();
}

class MotivationSectionState extends ConsumerState<MotivationSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final Timer _timer;
  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider);
    _tabController = TabController(length: user.reasons!.length, vsync: this);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _tabController.animateTo(
        (_tabController.index + 1) % user.reasons!.length,
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
              child: Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                final user = ref.watch(userProvider);
                return TabBarView(
                    controller: _tabController,
                    children: List.generate(
                        user.reasons!.length,
                        (i) => Center(
                                child: Text(
                              user.reasons![i],
                              textAlign: TextAlign.center,
                            ))));
              }),
            ),
            TabPageSelector(
              indicatorSize: 8,
              controller: _tabController,
              selectedColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
