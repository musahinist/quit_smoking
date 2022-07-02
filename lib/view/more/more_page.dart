import 'package:flutter/material.dart';

import '../home/title_widget.dart';
import 'smoker_info_section.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('More'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          const TitleWidget(title: 'Quitter Information'),
          ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: const Text('Former smoker data'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SmokerInfoSection()));
            },
          ),
          const TitleWidget(title: 'Community'),
          ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: const Text('Edit my profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => const MorePage()));
            },
          ),
        ],
      ),
    );
  }
}
