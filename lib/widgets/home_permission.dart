import 'package:flutter/material.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:goskomekologii/screens/permission_detail_page.dart';
import 'package:provider/provider.dart';

import '../providers/permission_provider.dart';

class HomePermission extends StatefulWidget {
  const HomePermission({super.key});

  @override
  State<HomePermission> createState() => _HomePermissionState();
}

class _HomePermissionState extends State<HomePermission> {
  List<String> statuses = ['done', 'active', 'cancelled'];
  int index = 0;

  String currentStatus = 'done';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PermissonProvider>(context, listen: true);
    var permession;
    currentStatus = 'done';
    if (provider.currentList.isNotEmpty) {
      permession = provider.currentList.last;
      currentStatus = permession.status;
    }

    return currentStatus == 'done'
        ? Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/not_active.png'),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const CheckoutPage()),
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
                  ),
                  child: const Text('Оформить разрешение'),
                ),
              ),
            ],
          )
        : Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            PermissionDetailPage(id: permession.id)))),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(1.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, left: 15, right: 15, bottom: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              permession.qrUrl,
                              width: 60,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                const SizedBox(height: 5),
                                Text(
                                  currentStatus == 'active'
                                      ? 'Текущий'
                                      : 'Отправьте отчёт',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: currentStatus == 'active'
                                        ? Colors.orange
                                        : Colors.red,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: currentStatus == 'active'
                    ? const ElevatedButton(
                        onPressed: null,
                        child: Text('Оформить разрешение'),
                      )
                    : ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text('Сдать отчет'),
                      ),
              ),
            ],
          );
  }
}
