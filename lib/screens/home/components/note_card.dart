import 'package:flutter/material.dart';
import 'package:keep/model/notes.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = note.content ?? "";
    if (content.length > 50) {
      content = content.substring(0, (content.length * 0.5).toInt());
    }


    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: note.color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (note.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              child: Text(
                note.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          if (note.imageUrl?.isNotEmpty ?? false) Image.network(note.imageUrl!),
          Padding(
            padding:  EdgeInsets.only(left: 15, right: 15, top: note.title.isEmpty?15:0 , bottom: 5),
            child: Text(
              content,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: _sizeOf(content)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 5,
              children: [
                ...note.tags!
                    .map((e) => _buildChips(e, note.color ?? Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildChips(String tag, Color color) {
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.zero,
      labelStyle: const TextStyle(fontSize: 11),
      label: Text(tag),
      backgroundColor: color.withAlpha(150),
    );
  }

  _sizeOf(String content) {
    var length = content.length;
    double size = 15;
    if (length < 20) size = 27;
    return size;
  }
}
