import 'package:flutter/material.dart';
import 'package:goskomekologii/models/friend_model.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/services/contants.dart';
import 'package:provider/provider.dart';

class CheckoutFriends extends StatelessWidget {
  CheckoutFriends({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final FriendModel currentUser;

  @override
  Widget build(BuildContext context) {
    final friends = Provider.of<FriendProvider>(context).list;
    void showFriends(BuildContext context) {
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
            contentPadding: const EdgeInsets.only(top: 0, right: 20, left: 20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Мои друзья',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Сохраненные данные друзей',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: friends
                          .map(
                            (friend) => GestureDetector(
                              onTap: () {},
                              child: Card(
                                shape: friend.id == 1
                                    ? RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.orange, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(4.0))
                                    : RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.white, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      bottom: 16,
                                      right: 10,
                                      left: 10),
                                  child: Stack(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage:
                                                    AssetImage(friend.imageUrl),
                                                radius: 30,
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${friend.surname} ${friend.firstName}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    'Охотничий билет ${friend.hunting_ticketCode}-${friend.hunting_ticketNumber}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    friend.phone_number,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
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
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(18, 158, 83, 1),
                            ),
                            child: const Text('Разрешение для друга'),
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

    void showNotFriends(BuildContext context) {
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
              children: const [
                Text(
                  'В вашем аккаунте отсутствуют данные ваших друзей',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
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
                            onPressed: () {
                              Navigator.of(context).pop();
                              showFriends(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(18, 158, 83, 1),
                            ),
                            child: const Text('Добаавить данные друга'),
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

    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 224, 224, 224),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('${currentUser.surname} ${currentUser.firstName}'),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => showNotFriends(context),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 224, 224, 224),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.people,
                color: APPBARCOLOR,
              ),
            ),
          ),
        )
      ],
    );
  }
}
