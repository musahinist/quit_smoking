import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_smoking/model/user_view_model.dart';

final authProvider = FutureProvider<Auth>((ref) async {
  await ref.watch(userProvider.notifier).authStateChanged();

  return Auth.authenticated;
});

enum Auth { authanticating, authenticated, unauthenticated }
