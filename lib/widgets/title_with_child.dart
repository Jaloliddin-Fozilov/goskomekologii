import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/permission_provider.dart';
import 'permission_item.dart';

class TitleWithChild extends StatelessWidget {
  const TitleWithChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final permessionProvider = Provider.of<PermissonProvider>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Мои разрешения',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => permessionProvider.getPermissions(),
              child: ListView.builder(
                itemCount: permessionProvider.list.length,
                itemBuilder: (ctx, i) => PermissionItem(
                  id: permessionProvider.list[i].id,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
