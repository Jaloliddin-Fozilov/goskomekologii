import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goskomekologii/models/friend_model.dart';
import 'package:goskomekologii/providers/checkout_provider.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/providers/permission_provider.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:goskomekologii/screens/checkout_single_animals_page.dart';
import 'package:goskomekologii/screens/home_page.dart';
import 'package:goskomekologii/screens/permission_detail_page.dart';
import 'package:goskomekologii/services/contants.dart';
import 'package:goskomekologii/services/update_all_data.dart';
import 'package:goskomekologii/widgets/checkout_checkboxes.dart';
import 'package:goskomekologii/widgets/checkout_dropdown.dart';
import 'package:goskomekologii/widgets/checkout_friends.dart';
import 'package:goskomekologii/widgets/checkout_pick_date.dart';

import 'package:provider/provider.dart';

class CheckoutPayment extends StatelessWidget {
  CheckoutPayment({super.key});

  void showAlertDialog(BuildContext context) async {
    final checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
    final status = await checkoutProvider.createPermission();

    await updateAllData(context);
    if (status)
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
                  width: 200,
                ),
                const Text(
                  'Оплата была \n выполнена успешно',
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(height: 10),
                // const Text(
                //   'Разрешение № 124-042/22',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                // const Text(
                //   'успешно сформированно!',
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
            actions: [
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
                  ),
                  child: const Text('Посмотреть детали'),
                ),
              ),
            ],
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        padding: const EdgeInsets.all(0),
                        splashRadius: 20,
                        iconSize: 24,
                        alignment: Alignment.center,
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(
                        'Оформление разрешения',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Методы оплаты',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: APPBARCOLOR,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/uzcard.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 224, 224, 224),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/visa.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Номер карты',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(3),
                              width: double.infinity,
                              child: TextFormField(
                                initialValue: '',
                                textAlign: TextAlign.left,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(19),
                                  CardNumberInputFormatter(),
                                ],
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Срок действия',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(3),
                              width: double.infinity,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  hintText: "MM/YY",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                  CardMonthInputFormatter(),
                                ],
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CVV',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "---",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                showAlertDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
              ),
              child: const Text('Оплатить'),
            ),
          ),
        ),
      ],
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
