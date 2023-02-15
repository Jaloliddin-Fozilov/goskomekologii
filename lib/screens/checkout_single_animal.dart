import 'package:flutter/material.dart';
import 'package:goskomekologii/models/animal_model.dart';
import 'package:goskomekologii/models/friend_model.dart';
import 'package:goskomekologii/providers/checkout_provider.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/providers/permission_provider.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:goskomekologii/services/contants.dart';
import 'package:goskomekologii/widgets/checkout_checkboxes.dart';
import 'package:goskomekologii/widgets/checkout_dropdown.dart';
import 'package:goskomekologii/widgets/checkout_friends.dart';
import 'package:goskomekologii/widgets/checkout_pick_date.dart';
import 'package:provider/provider.dart';

class CheckoutSingleAnimal extends StatefulWidget {
  const CheckoutSingleAnimal({super.key});

  @override
  State<CheckoutSingleAnimal> createState() => _CheckoutSingleAnimalState();
}

class _CheckoutSingleAnimalState extends State<CheckoutSingleAnimal> {
  final _formKey = GlobalKey<FormState>();
  // final permession = Provider.of<PermissonProvider>(context).list[0];

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider>(context);
    List<AnimalModel> animals = checkoutProvider.currentCheckout.animals;
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
                    'Птицы',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: animals
                                .map(
                                  (animal) => Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    padding: const EdgeInsets.all(10),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 172, 172, 172),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(animal.name),
                                        Text(
                                          '${animal.count} шт.',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: animals
                                .map(
                                  (animal) => Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    padding: const EdgeInsets.all(20),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '${animal.price.toString()} сум',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: animals
                                  .map(
                                    (animal) => Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(3),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              6,
                                          child: TextFormField(
                                            initialValue:
                                                animal.input.toString(),
                                            textAlign: TextAlign.center,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                animal.input = int.parse(value);
                                              });
                                            },
                                            keyboardType: TextInputType.number,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'В разрешение будет добавлено ${checkoutProvider.getCount()} птиц',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Предварительная стоимость:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${checkoutProvider.getPrice} сум',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
                  ),
                  child: const Text('Сохранить'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
