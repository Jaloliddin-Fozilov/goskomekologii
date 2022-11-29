import 'package:flutter/material.dart';

import '../models/friend_model.dart';

class FriendProvider with ChangeNotifier {
  FriendModel get currentUser {
    return FriendModel(
      id: 0,
      surname: 'Пономарев',
      firstName: 'Дмитрий',
      patronymic: 'Сергеевич',
      imageUrl: 'assets/images/Dmitriy_1.png',
      phone_number: '+998 99 999 99 99',
      hunting_ticketCode: 'Ю',
      hunting_ticketNumber: 144,
      weapon_permitCode: 'П',
      weapon_permitNumber: 6,
    );
  }

  List<FriendModel> _list = [
    FriendModel(
      id: 0,
      surname: 'Юлдашев',
      firstName: 'Рауль',
      patronymic: 'Александрович',
      imageUrl: 'assets/images/friend.png',
      phone_number: '+998 99 885 9203',
      hunting_ticketCode: 'Ю',
      hunting_ticketNumber: 213,
      weapon_permitCode: 'П',
      weapon_permitNumber: 7,
    ),
    FriendModel(
      id: 1,
      surname: 'Юлдашев',
      firstName: 'Рауль',
      patronymic: 'Александрович',
      imageUrl: 'assets/images/friend.png',
      phone_number: '+998 99 885 9203',
      hunting_ticketCode: 'Ю',
      hunting_ticketNumber: 213,
      weapon_permitCode: 'П',
      weapon_permitNumber: 7,
    ),
    FriendModel(
      id: 2,
      surname: 'Юлдашев',
      firstName: 'Рауль',
      patronymic: 'Александрович',
      imageUrl: 'assets/images/friend.png',
      phone_number: '+998 99 885 9203',
      hunting_ticketCode: 'Ю',
      hunting_ticketNumber: 213,
      weapon_permitCode: 'П',
      weapon_permitNumber: 7,
    ),
  ];

  List<FriendModel> get list {
    return [..._list];
  }

  FriendModel findById(int id) {
    return _list.firstWhere((friend) => friend.id == id);
  }
}
