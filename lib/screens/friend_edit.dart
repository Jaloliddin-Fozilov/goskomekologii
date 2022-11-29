import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/friend_model.dart';
import '../providers/friend_provider.dart';
import 'friends_page.dart';

class FriendEdit extends StatelessWidget {
  final int? id;
  const FriendEdit({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    FriendModel currentFriend = FriendModel(
      id: 0,
      surname: ' ',
      firstName: ' ',
      patronymic: ' ',
      imageUrl: ' ',
      phone_number: ' ',
      hunting_ticketCode: ' ',
      hunting_ticketNumber: 0,
      weapon_permitCode: ' ',
      weapon_permitNumber: 0,
    );
    if (id != null) {
      currentFriend = Provider.of<FriendProvider>(context).findById(id!);
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Добавить данные друга',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Вы сможете оформлять для него разрешения',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ваш номер телефона',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: double.infinity,
                        child: TextFormField(
                          initialValue: currentFriend.phone_number,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ФИО друга',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            width: double.infinity,
                            child: TextFormField(
                              initialValue: currentFriend.surname,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            width: double.infinity,
                            child: TextFormField(
                              initialValue: currentFriend.firstName,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            width: double.infinity,
                            child: TextFormField(
                              initialValue: currentFriend.patronymic,
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Данные охотничьего билета друга',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              child: TextFormField(
                                initialValue: currentFriend.hunting_ticketCode,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              child: TextFormField(
                                initialValue:
                                    currentFriend.hunting_ticketNumber == 0
                                        ? ''
                                        : currentFriend.hunting_ticketNumber
                                            .toString(),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Данные о разрешении на оружие друга',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              child: TextFormField(
                                initialValue: currentFriend.weapon_permitCode,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              child: TextFormField(
                                initialValue:
                                    currentFriend.weapon_permitNumber == 0
                                        ? ''
                                        : currentFriend.weapon_permitNumber
                                            .toString(),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const FriendsPage()),
                  )),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
              ),
              child: const Text('Сохранить'),
            ),
          ),
        ],
      ),
    );
  }
}
