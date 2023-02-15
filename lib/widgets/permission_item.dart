import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/permission_provider.dart';
import '../screens/permission_detail_page.dart';

class PermissionItem extends StatelessWidget {
  final int id;

  const PermissionItem({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final permession = Provider.of<PermissonProvider>(context).findById(id);
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => PermissionDetailPage(id: id)))),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white38,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  if (permession.dontSend)
                    Positioned(
                      right: 10,
                      child: Image.asset(
                        'assets/images/image_8.png',
                        width: 20,
                      ),
                    ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 40,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            permession.status == 'active'
                                ? 'Текущий'
                                : permession.status == 'canceled'
                                    ? 'Отменен'
                                    : 'Исполнен',
                            style: TextStyle(
                              color: permession.status == 'active'
                                  ? Colors.orange
                                  : permession.status == 'canceled'
                                      ? Colors.red
                                      : Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${permession.title} от ${permession.startDate}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${permession.address} ${permession.startDate}-${permession.endDate}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
