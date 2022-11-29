import 'package:flutter/material.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:provider/provider.dart';

import '../providers/permission_provider.dart';

class HomePermission extends StatefulWidget {
  final int id;
  const HomePermission({required this.id, super.key});

  @override
  State<HomePermission> createState() => _HomePermissionState();
}

class _HomePermissionState extends State<HomePermission> {
  List<String> statuses = ['done', 'active', 'cancelled'];
  int index = 0;

  String currentStatus = 'done';
  @override
  Widget build(BuildContext context) {
    final permession =
        Provider.of<PermissonProvider>(context).findById(widget.id);

    void changeStatus() {
      if (index < statuses.length - 1) {
        index++;
      } else {
        index = 0;
      }
      setState(() {
        currentStatus = statuses[index];
      });
    }

    return currentStatus == 'done'
        ? Column(
            children: [
              GestureDetector(
                onTap: changeStatus,
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
                onTap: changeStatus,
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
                                        '${permession.title} от ${permession.startDate.year}.${permession.startDate.month}.${permession.startDate.day}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${permession.address}${permession.startDate.year}.${permession.startDate.month}.${permession.startDate.day}-${permession.endDate.year}.${permession.endDate.month}.${permession.endDate.day}',
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
