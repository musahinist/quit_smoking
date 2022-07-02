import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/user_view_model.dart';

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        TextFormField(
          controller: _controller,
          maxLines: null,
          autofocus: true,
          maxLength: 144,
          decoration: const InputDecoration(
            hintText: 'Reason to quit smoking...',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
            ),
          ),
          onChanged: (value) {},
        ),
        const SizedBox(height: 16),
        Consumer(
          builder: (context, ref, child) {
            final user = ref.watch(userProvider);
            return ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    ref.read(userProvider.notifier).updateUser(user.copyWith(
                        reasons: user.reasons!.toList()
                          ..add(_controller.text)));
                  }
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pop();
                },
                child: const Text('Save'));
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
