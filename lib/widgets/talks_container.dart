import 'package:flutter/material.dart';
import 'package:lets_connect/config/palette.dart';
import 'package:lets_connect/models/models.dart';
import 'package:lets_connect/widgets/widgets.dart';

class TalksContainer extends StatelessWidget {
  final List<User> onlineUsers;

  const TalksContainer({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0),
      elevation: (isDesktop ? 1.0 : 0),
      shape: (isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null),
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _NewTalksButton(),
              );
            }

            final User user = onlineUsers[index - 1];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                profileAvatar: user,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NewTalksButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print('Create New Talks'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.black,
      borderSide: BorderSide(width: 3.0, color: Colors.blueAccent),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          /*ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),*/
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          const SizedBox(width: 10.0),
          Text('Start\nTalks')
        ],
      ),
    );
  }
}
