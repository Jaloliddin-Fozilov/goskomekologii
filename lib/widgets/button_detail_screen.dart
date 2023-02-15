import 'package:flutter/material.dart';
import 'package:goskomekologii/providers/permission_provider.dart';
import 'package:goskomekologii/screens/permessions_page.dart';
import 'package:goskomekologii/services/update_all_data.dart';
import 'package:provider/provider.dart';

import '../models/permission_model.dart';
import '../screens/home_page.dart';

class ButtonsDetailsScreen extends StatefulWidget {
  const ButtonsDetailsScreen({
    Key? key,
    required this.permession,
  }) : super(key: key);

  final PermissionModel permession;

  @override
  State<ButtonsDetailsScreen> createState() => _ButtonsDetailsScreenState();
}

class _ButtonsDetailsScreenState extends State<ButtonsDetailsScreen> {
  bool _isLoading = false;
  void showAlertDialog(BuildContext context, PermissionModel permission) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          title: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: Colors.green,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 0, right: 10, left: 10),
          content: Text(
            'Вы точно хотите закрыть разрешение Разрешение ${permission.title} и отправить результаты вашей охоты/ловли в Госбиоконтроль?',
            textAlign: TextAlign.center,
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 6,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            await Provider.of<PermissonProvider>(context,
                                    listen: false)
                                .finishPermission(permission.id)
                                .then((value) => value
                                    ? showDoneAlertDialog(context)
                                    : showErroralertDialog(context));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(18, 158, 83, 1),
                          ),
                          child: const Text('Да'),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 6,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Отмена!'),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        );
      },
    );
  }

  void showErroralertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          title: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: Colors.green,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 0, right: 10, left: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/error_alert.png',
                width: 250,
              ),
              const Text(
                'Ваш отчет был сформирован и будет автоматически отправлен при поялении Интернета на вашем устройстве!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            ],
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 6,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const HomePage()),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Перейти на Главную'),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        );
      },
    );
  }

  void showDoneAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          title: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: Colors.green,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 0, right: 10, left: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/done_alert.png',
                width: 250,
              ),
              const Text(
                'Ваш отчет был сформирован и успешно отправлен!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            ],
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 6,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const HomePage()),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(18, 158, 83, 1),
                          ),
                          child: const Text('Перейти на Главную'),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.permession.status == 'active' && !widget.permession.dontSend
        ? _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await Provider.of<PermissonProvider>(context,
                                listen: false)
                            .updateAnimalPermissions(widget.permession.id);
                        await updateAllData(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const HomePage()),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
                      ),
                      child: const Text('Сохранить данные'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '- или -',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () =>
                          showAlertDialog(context, widget.permession),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Закончить и отправить отчет!'),
                    ),
                  ),
                ],
              )
        : SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: widget.permession.dontSend
                  ? () => showAlertDialog(context, widget.permession)
                  : () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const HomePage()),
                        ),
                      ),
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.permession.dontSend
                    ? Colors.orange
                    : const Color.fromRGBO(18, 158, 83, 1),
              ),
              child: Text(
                widget.permession.dontSend
                    ? 'Отправить отчёт повторно!'
                    : 'Отчёт отправлен УСПЕШНО!',
              ),
            ),
          );
  }
}
