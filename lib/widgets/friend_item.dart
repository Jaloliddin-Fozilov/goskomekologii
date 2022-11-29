import 'package:flutter/material.dart';

import '../models/friend_model.dart';
import '../screens/friend_edit_screen.dart';

class FriendItem extends StatelessWidget {
  final FriendModel friend;
  const FriendItem({
    required this.friend,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 16.0, bottom: 16, right: 10, left: 10),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(friend.imageUrl),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${friend.surname} ${friend.firstName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Охотничий билет ${friend.hunting_ticketCode}-${friend.hunting_ticketNumber}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          friend.phone_number,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => FriendEditScreen(
                            id: friend.id,
                          )),
                    ),
                  ),
                  icon: const Icon(
                    Icons.edit_note_outlined,
                    color: Colors.grey,
                    size: 36,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
