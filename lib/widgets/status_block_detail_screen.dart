import 'package:flutter/material.dart';

import '../models/permission_model.dart';

class StatusBlockDetailScreen extends StatelessWidget {
  const StatusBlockDetailScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            permession.status == 'canceled'
                ? const Icon(
                    Icons.error,
                    color: Colors.red,
                  )
                : permession.dontSend
                    ? Image.asset(
                        'assets/images/image_8.png',
                        width: 20,
                      )
                    : const Icon(
                        Icons.check_circle,
                        color: Color.fromRGBO(33, 173, 100, 1),
                      ),
            const SizedBox(width: 10),
            Text(
              permession.status == 'canceled'
                  ? 'Отменен'
                  : permession.dontSend
                      ? 'Не отправлено'
                      : 'ОТПРАВЛЕНО!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: permession.status == 'canceled'
                    ? Colors.red
                    : permession.dontSend
                        ? Colors.black
                        : const Color.fromRGBO(33, 173, 100, 1),
              ),
            )
          ],
        ),
      ],
    );
  }
}
