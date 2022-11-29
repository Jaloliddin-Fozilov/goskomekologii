import 'package:flutter/material.dart';

import '../models/permission_model.dart';

class NameQrBlockDetailScreen extends StatelessWidget {
  const NameQrBlockDetailScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Пономарев Дмитрий',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Охотничий билет  '),
                Text(
                  permession.hunting_ticket,
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
                  permession.weapon_permit,
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
