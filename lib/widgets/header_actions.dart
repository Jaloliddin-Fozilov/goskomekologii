import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friend_provider.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<FriendProvider>(context).currentUser;
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${currentUser.surname} ${currentUser.firstName}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Охотничий билет ${currentUser.hunting_ticketCode}-${currentUser.hunting_ticketNumber}',
            )
          ],
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundImage: AssetImage(currentUser.imageUrl),
          radius: 24,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
