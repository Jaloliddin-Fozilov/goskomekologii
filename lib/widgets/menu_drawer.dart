import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/friends_page.dart';
import '../screens/home_page.dart';
import '../screens/permission_page.dart';
import '../screens/profile_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Пономарев Дмитрий',
                      style: TextStyle(
                        color: const Color.fromRGBO(18, 21, 76, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'ID: 233256',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Column(
                  children: [
                    ListTile(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const HomePage()),
                          )),
                      leading: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(243, 247, 249, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.home_filled,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(
                        'Главная',
                        style: TextStyle(
                          color: const Color.fromRGBO(18, 31, 62, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: ListTile(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const PermissionPage()),
                            )),
                        leading: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(243, 247, 249, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.inbox_outlined,
                            color: Colors.blue,
                          ),
                        ),
                        title: Text(
                          'Разрешения',
                          style: TextStyle(
                            color: const Color.fromRGBO(18, 31, 62, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: ListTile(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const FriendsPage()),
                            )),
                        leading: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(243, 247, 249, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.people,
                            color: Colors.blue,
                          ),
                        ),
                        title: Text(
                          'Друзья',
                          style: TextStyle(
                            color: const Color.fromRGBO(18, 31, 62, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: ListTile(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const ProfilePage()),
                            )),
                        leading: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(243, 247, 249, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.blue,
                          ),
                        ),
                        title: Text(
                          'Настройки аккаунта',
                          style: TextStyle(
                            color: const Color.fromRGBO(18, 31, 62, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {},
                        leading: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(243, 247, 249, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.headphones,
                            color: Colors.blue,
                          ),
                        ),
                        title: Text(
                          'Служба поддержки',
                          style: TextStyle(
                            color: const Color.fromRGBO(18, 31, 62, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '+99871 207 07 70',
                            style: TextStyle(
                              color: const Color.fromRGBO(18, 31, 62, 1),
                              fontSize: 16,
                              fontFamily:
                                  GoogleFonts.sourceSansPro().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 0),
            ListTile(
              onTap: () {},
              leading: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 247, 249, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.exit_to_app,
                  color: Colors.blue,
                ),
              ),
              title: Text(
                'Выйти',
                style: TextStyle(
                  color: const Color.fromRGBO(18, 31, 62, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                ),
              ),
              trailing: Text(
                'Версия 1.0.1',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
