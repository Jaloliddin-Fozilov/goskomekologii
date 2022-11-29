import 'package:flutter/material.dart';

import '../services/contants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: APPBARCOLOR,
      toolbarHeight: 84,
      actions: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Пономарев Дмитрий',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Охотничий билет Ю-144',
                )
              ],
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Dmitriy_1.png'),
              radius: 24,
            ),
            const SizedBox(width: 16),
          ],
        )
      ],
    );
  }
}
