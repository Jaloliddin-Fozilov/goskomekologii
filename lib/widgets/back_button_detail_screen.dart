import 'package:flutter/material.dart';

import '../models/permission_model.dart';
import '../screens/home_page.dart';
import '../screens/permission_detail_page.dart';

class BackButtonDetailScreen extends StatelessWidget {
  const BackButtonDetailScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  @override
  Widget build(BuildContext context) {
    void goToBack() {
      PermissionDetailPageState().backButton();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const HomePage()),
        ),
      );
    }

    return Row(
      children: [
        IconButton(
          onPressed: goToBack,
          padding: const EdgeInsets.all(0),
          splashRadius: 25,
          iconSize: 28,
          alignment: Alignment.centerLeft,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Text(
          permession.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
