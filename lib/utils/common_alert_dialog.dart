
import 'package:flutter/material.dart';


class CommonAlert {
  static Future<void> showAddToPlaylistDialog(BuildContext context ,String userId, String musicId, String musicHref,String musicTitle, String musicImage) async {
   // final bloc = context.read<ProfileCubit>();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add to Playlist'),
          actions: <Widget>[
            TextButton(
              onPressed: () {

                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic to add the song to the selected playlist
              //  bloc.addToPlayList(userId, musicId, musicHref, musicTitle, musicImage);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

