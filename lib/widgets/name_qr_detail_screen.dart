import 'package:flutter/material.dart';
import 'package:goskomekologii/models/friend_model.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:provider/provider.dart';

import '../models/permission_model.dart';

class NameQrBlockDetailScreen extends StatelessWidget {
  const NameQrBlockDetailScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  @override
  Widget build(BuildContext context) {
    final friendProvider = Provider.of<FriendProvider>(context, listen: true);
    int currentUserId = friendProvider.currentUser.id;

    FriendModel friend = permession.friendId == currentUserId
        ? friendProvider.currentUser
        : friendProvider.findById(permession.friendId);
    print(friend);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              friend.firstName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Охотничий билет  '),
                Text(
                  '${friend.hunting_ticketCode}-${friend.hunting_ticketNumber}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Разрешение на оружие  '),
                Text(
                  '${friend.weapon_permitCode}-${friend.weapon_permitNumber}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
        Image.asset(
          'assets/images/qr.png',
          width: 120,
        )
      ],
    );
  }
}
