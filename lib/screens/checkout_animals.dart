import 'package:flutter/material.dart';
import 'package:goskomekologii/models/checkout_model.dart';
import 'package:goskomekologii/models/friend_model.dart';
import 'package:goskomekologii/providers/checkout_provider.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/providers/permission_provider.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:goskomekologii/screens/checkout_payment_page.dart';
import 'package:goskomekologii/screens/checkout_single_animals_page.dart';
import 'package:goskomekologii/services/contants.dart';
import 'package:goskomekologii/widgets/checkout_checkboxes.dart';
import 'package:goskomekologii/widgets/checkout_dropdown.dart';
import 'package:goskomekologii/widgets/checkout_friends.dart';
import 'package:goskomekologii/widgets/checkout_pick_date.dart';
import 'package:provider/provider.dart';

class CheckoutAnimals extends StatefulWidget {
  CheckoutAnimals({super.key});

  @override
  State<CheckoutAnimals> createState() => _CheckoutAnimalsState();
}

class _CheckoutAnimalsState extends State<CheckoutAnimals> {
  bool _initVisit = true;

  @override
  Widget build(BuildContext context) {
    if (_initVisit) {
      final provider = Provider.of<CheckoutProvider>(context);
      CheckoutModel checkoutModel = provider.currentCheckout;
      _initVisit = false;
    }

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
                  Column(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text('Дикие животные'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: ((context) =>
                                      CheckoutSingleAnimalPage()),
                                )),
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Рыба'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: ((context) =>
                                      CheckoutSingleAnimalPage()),
                                )),
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Птицы'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange,
                                ),
                                child: const Text(
                                  '25',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: ((context) =>
                                      CheckoutSingleAnimalPage()),
                                )),
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
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
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const CheckoutPaymentPage()),
                  (Route<dynamic> route) => false),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
              ),
              child: const Text('Перейти к оплате'),
            ),
          ),
        ),
      ],
    );
  }
}
