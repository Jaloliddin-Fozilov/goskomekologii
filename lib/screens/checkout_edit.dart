import 'package:flutter/material.dart';
import 'package:goskomekologii/models/checkout_model.dart';
import 'package:goskomekologii/models/friend_model.dart';
import 'package:goskomekologii/providers/checkout_provider.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/screens/checkout_animals_page.dart';
import 'package:goskomekologii/screens/checkout_page.dart';
import 'package:goskomekologii/services/contants.dart';
import 'package:goskomekologii/widgets/checkout_checkboxes.dart';
import 'package:goskomekologii/widgets/checkout_dropdown.dart';
import 'package:goskomekologii/widgets/checkout_friends.dart';
import 'package:goskomekologii/widgets/checkout_pick_date.dart';
import 'package:provider/provider.dart';

class CheckoutEdit extends StatelessWidget {
  CheckoutEdit({super.key});

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
                  const Text(
                    'Оформление разрешения',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Выберите тип разрешения'),
                  const SizedBox(height: 10),
                  const CheckoutCheckboxes(),
                  const SizedBox(height: 10),
                  const Text('Регион добычи'),
                  const SizedBox(height: 10),
                  const CheckoutDropdown(isRegions: true),
                  const SizedBox(height: 10),
                  const Text('Район добычи'),
                  const SizedBox(height: 10),
                  const CheckoutDropdown(isRegions: false),
                  const SizedBox(height: 10),
                  const Text('Срок проведения добычи животных'),
                  const SizedBox(height: 10),
                  const CheckoutPickDate(),
                  const SizedBox(height: 10),
                  const Text('Для кого оформляется разрешение'),
                  const SizedBox(height: 10),
                  CheckoutFriends()
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
              onPressed: () async {
                final provider =
                    Provider.of<CheckoutProvider>(context, listen: false);
                final checkoutModel = provider.currentCheckout;
                final currentUserId =
                    Provider.of<FriendProvider>(context, listen: false)
                        .currentUser
                        .id;
                if (checkoutModel.friendId == 0) {
                  provider.updateCheckout(CheckoutModel(
                    regionId: checkoutModel.regionId,
                    districtId: checkoutModel.districtId,
                    startDate: checkoutModel.startDate,
                    endDate: checkoutModel.endDate,
                    type: checkoutModel.type,
                    status: checkoutModel.status,
                    price: checkoutModel.price,
                    animals: checkoutModel.animals,
                    friendId: currentUserId,
                  ));
                }
                Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const CheckoutAnimalsPage()),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
              ),
              child: const Text('Далее'),
            ),
          ),
        ),
      ],
    );
  }
}
