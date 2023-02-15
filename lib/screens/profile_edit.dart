import 'package:flutter/material.dart';
import 'package:goskomekologii/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../models/friend_model.dart';
import '../providers/friend_provider.dart';
import 'home_page.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _keyForm = GlobalKey<FormState>();

  bool _isLoading = false;

  String _surname = '';
  String _firstName = '';
  String _patronymic = '';
  String _huntingTicketCode = '';
  int _huntingTicketNumber = 0;
  String _weaponPermitCode = '';
  int _weaponPermitNumber = 0;

  @override
  Widget build(BuildContext context) {
    final friendProvider = Provider.of<FriendProvider>(context);
    final currentUser = friendProvider.currentUser;
    final authProvider = Provider.of<AuthProvider>(context);

    Future<void> submit() async {
      if (_keyForm.currentState!.validate()) {
        _keyForm.currentState!.save();
        setState(() {
          _isLoading = true;
        });
        FriendModel updatedUser = FriendModel(
          id: currentUser.id,
          surname: _surname,
          firstName: _firstName,
          patronymic: _patronymic,
          imageUrl: currentUser.imageUrl,
          phone_number: authProvider.getPhoneNumber,
          hunting_ticketCode: _huntingTicketCode,
          hunting_ticketNumber: _huntingTicketNumber,
          weapon_permitCode: _weaponPermitCode,
          weapon_permitNumber: _weaponPermitNumber,
        );
        await friendProvider.saveProfile(updatedUser).then((_) =>
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false));
        ;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Мой профиль',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Редактирование данных аккунта',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Ваш номер телефона',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ' (авторизован)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(3),
                          width: double.infinity,
                          child: Text(
                            authProvider.getPhoneNumber,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ваше ФИО',
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
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  hintText: currentUser.surname,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (value) {
                                  setState(() {
                                    _surname = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Введите фамилию';
                                  }
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              width: double.infinity,
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  hintText: currentUser.firstName,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                onChanged: (value) {
                                  setState(() {
                                    _firstName = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Введите имя';
                                  }
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              width: double.infinity,
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  hintText: currentUser.patronymic,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
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
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: currentUser.hunting_ticketCode,
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText:
                                        currentUser.hunting_ticketNumber == 0
                                            ? ''
                                            : currentUser.hunting_ticketNumber
                                                .toString(),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: currentUser.weapon_permitCode,
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText:
                                        currentUser.weapon_permitNumber == 0
                                            ? ''
                                            : currentUser.weapon_permitNumber
                                                .toString(),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
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
                    onPressed: () async {
                      await submit();
                    },
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
