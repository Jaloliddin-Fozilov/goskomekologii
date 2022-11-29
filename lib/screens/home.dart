import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/permission_provider.dart';
import '../widgets/home_permission.dart';
import '../widgets/title_with_child.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePermission(
            id: Provider.of<PermissonProvider>(context).list[3].id,
          ),
          const SizedBox(height: 10),
          const TitleWithChild()
        ],
      ),
    );
  }
}
