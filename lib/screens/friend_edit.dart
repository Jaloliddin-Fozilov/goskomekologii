import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/friend_model.dart';
import '../providers/friend_provider.dart';
import 'friends_page.dart';

class FriendEdit extends StatefulWidget {
  final int? id;
  const FriendEdit({super.key, this.id});

  @override
  State<FriendEdit> createState() => _FriendEditState();
}

class _FriendEditState extends State<FriendEdit> {
  bool _isLoading = false;
  bool _initVisit = true;
  final _formKey = GlobalKey<FormState>();

  String _surname = '';
  String _firstName = '';
  String _patronymic = '';
  String _huntingTicketCode = '';
  int _huntingTicketNumber = 0;
  String _weaponPermitCode = '';
  int _weaponPermitNumber = 0;
  String _phoneNumber = '';

  FriendModel currentFriend = FriendModel(
    id: 0,
    surname: '',
    firstName: '',
    patronymic: '',
    imageUrl: 'assets/images/friend.png',
    phone_number: '',
    hunting_ticketCode: '',
    hunting_ticketNumber: 0,
    weapon_permitCode: '',
    weapon_permitNumber: 0,
  );

  @override
  Widget build(BuildContext context) {
    if (widget.id != null && _initVisit) {
      currentFriend = Provider.of<FriendProvider>(context, listen: false)
          .findById(widget.id!);

      _surname = currentFriend.surname;
      _firstName = currentFriend.firstName;
      _patronymic = currentFriend.patronymic;
      _huntingTicketCode = currentFriend.hunting_ticketCode;
      _huntingTicketNumber = currentFriend.hunting_ticketNumber;
      _weaponPermitCode = currentFriend.weapon_permitCode;
      _weaponPermitNumber = currentFriend.weapon_permitNumber;
      _phoneNumber = currentFriend.phone_number;
      _initVisit = false;
    }
    Future<void> submit() async {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        _formKey.currentState!.save();
        if (widget.id == null) {
          // add friend
          final newFriend = FriendModel(
            id: currentFriend.id,
            surname: _surname,
            firstName: _firstName,
            patronymic: _patronymic,
            imageUrl: currentFriend.imageUrl,
            phone_number: _phoneNumber,
            hunting_ticketCode: _huntingTicketCode,
            hunting_ticketNumber: _huntingTicketNumber,
            weapon_permitCode: _weaponPermitCode,
            weapon_permitNumber: _weaponPermitNumber,
          );
          await Provider.of<FriendProvider>(context, listen: false)
              .createFriend(newFriend)
              .then((_) {
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const FriendsPage()),
                (Route<dynamic> route) => false);
          });
        } else {
          // update friend
          final updatedFriend = FriendModel(
            id: widget.id!,
            surname: _surname,
            firstName: _firstName,
            patronymic: _patronymic,
            imageUrl: currentFriend.imageUrl,
            phone_number: _phoneNumber,
            hunting_ticketCode: _huntingTicketCode,
            hunting_ticketNumber: _huntingTicketNumber,
            weapon_permitCode: _weaponPermitCode,
            weapon_permitNumber: _weaponPermitNumber,
          );
          await Provider.of<FriendProvider>(context, listen: false)
              .updateFriend(updatedFriend)
              .then((_) {
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const FriendsPage()),
                (Route<dynamic> route) => false);
          });
        }
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Expanded(
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
                          'Номер телефона',
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
                            decoration: InputDecoration(
                              hintText: currentFriend.phone_number,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите номер телефона';
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                _phoneNumber = value;
                              });
                            },
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
                                decoration: InputDecoration(
                                  hintText: currentFriend.surname,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Введите фамилию';
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _surname = value;
                                  });
                                },
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
                                decoration: InputDecoration(
                                  hintText: currentFriend.firstName,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Введите имя';
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _firstName = value;
                                  });
                                },
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
                                decoration: InputDecoration(
                                  hintText: currentFriend.patronymic,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Введите отчество';
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _patronymic = value;
                                  });
                                },
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
                                  initialValue:
                                      currentFriend.hunting_ticketCode,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: currentFriend.hunting_ticketCode,
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _huntingTicketCode = value;
                                    });
                                  },
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
                                  decoration: InputDecoration(
                                    hintText:
                                        currentFriend.hunting_ticketNumber == 0
                                            ? ''
                                            : currentFriend.hunting_ticketNumber
                                                .toString(),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _huntingTicketNumber = int.parse(value);
                                    });
                                  },
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
                                  decoration: InputDecoration(
                                    hintText: currentFriend.weapon_permitCode,
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _weaponPermitCode = value;
                                    });
                                  },
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
                                  decoration: InputDecoration(
                                    hintText:
                                        currentFriend.weapon_permitNumber == 0
                                            ? ''
                                            : currentFriend.weapon_permitNumber
                                                .toString(),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _weaponPermitNumber = int.parse(value);
                                    });
                                  },
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
          ),
          _isLoading
              ? const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async => await submit(),
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
