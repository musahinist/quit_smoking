import 'dart:async';

import 'package:riverpod/riverpod.dart';

import 'user/mock_user.dart';
import 'user/user.dart';

final userProvider = StateNotifierProvider<UserViewModel, User>((ref) {
  return UserViewModel();
});

class UserViewModel extends StateNotifier<User> {
  // 1. initialize with current user
  UserViewModel() : super(mockUser);
  void updateUser(User user) => state = user;
}
