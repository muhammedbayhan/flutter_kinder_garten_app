import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kindergartenapp/product/constants/colorsP.dart';

class UserChatCard extends StatelessWidget {
  const UserChatCard({super.key, required this.name,required this.lastMessage,required this.time,required this.messageCount,required this.svgUrl});

  final String name;
  final String lastMessage;
  final String time;
  final String messageCount;
  final String svgUrl;
  


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: Colors.white.withOpacity(0.7),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueGrey,
            child: SvgPicture.asset(
             svgUrl,
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle:  Text(
           lastMessage, // Add last message text here
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                time, // Add time here
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsP.primary.withOpacity(0.7),
                ),
                child:  Text(
                 messageCount, // Add unread message count here
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
