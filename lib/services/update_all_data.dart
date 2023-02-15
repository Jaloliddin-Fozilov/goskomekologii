import 'package:flutter/material.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/providers/permission_provider.dart';
import 'package:provider/provider.dart';

Future<void> updateAllData(BuildContext context) async {
  await Provider.of<FriendProvider>(context, listen: false).getProfileDetails();
  await Provider.of<FriendProvider>(context, listen: false).getFriends();
  await Provider.of<PermissonProvider>(context, listen: false).getPermissions();
  await Provider.of<PermissonProvider>(context, listen: false)
      .getCurrentPermissions();
  await Provider.of<PermissonProvider>(context, listen: false)
      .getArchivePermissions();
}
