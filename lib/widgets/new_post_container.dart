import 'package:flutter/material.dart';
import 'package:lets_connect/models/models.dart';
import 'package:lets_connect/widgets/widgets.dart';

class NewPostContainer extends StatelessWidget {
  final User currentUser;

  const NewPostContainer({Key? key, required this.currentUser})
      : super(key: key);

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
        padding: const EdgeInsets.fromLTRB(12.0, 15.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(
                  profileAvatar: currentUser,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'Explore your mind...')),
                ),
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      onPressed: () => print('Live'),
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live')),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                      onPressed: () => print('Galary'),
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.lightGreen,
                      ),
                      label: Text('Galary')),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                      onPressed: () => print('Talks'),
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.indigo,
                      ),
                      label: Text('Talks')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
