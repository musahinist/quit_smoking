import 'package:riverpod/riverpod.dart';

import 'mock_user.dart';
import 'user/user.dart';

final userProvider = StateNotifierProvider<UserViewModel, User>((ref) {
  return UserViewModel()..authStateChanged();
});

class UserViewModel extends StateNotifier<User> {
  // 1. initialize with current user
  UserViewModel() : super(mockUser);
  void updateUser(User user) => state = user;

  authStateChanged() async {
    // 2. update user
    await Future.delayed(Duration(seconds: 3));
    state = state.copyWith(
      firstSetup: true,
    );
  }
}
