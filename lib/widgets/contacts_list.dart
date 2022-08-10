// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({
    super.key,
    required this.name,
    required this.number,
    required this.imageURL,
  });

  final String name;
  final String number;
  final String imageURL;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (context) async {
              await launch('tel://$number');
            },
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.phone,
            label: 'Call',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              //delete
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ColoredBox(
        color: Colors.deepPurple,
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          subtitle: Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageURL),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  // Future<void> _makePhoneCall(String url) async {
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     debugPrint('Could not launch $url');
  //   }
  // }
}
