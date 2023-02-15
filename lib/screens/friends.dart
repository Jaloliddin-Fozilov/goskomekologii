import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friend_provider.dart';
import '../widgets/friend_item.dart';
import 'friend_edit_screen.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async =>
                  await Provider.of<FriendProvider>(context, listen: false)
                      .getFriends(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Мои друзья',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Сохраненные данные друзей',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: Provider.of<FriendProvider>(context)
                          .list
                          .map((friend) => FriendItem(friend: friend))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const FriendEditScreen()),
                  (Route<dynamic> route) => false),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
              ),
              child: const Text('Добавить данные друга'),
            ),
          ),
        ],
      ),
    );
  }
}
