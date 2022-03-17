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
          color: note.color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black45, width: 1)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor:
              _getComplementColor(note.color ?? Colors.white).withAlpha(25),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (note.title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Text(
                    note.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              if (note.imageUrl?.isNotEmpty ?? false) _buildImage(),
              Padding(
                padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: note.title.isEmpty ? 15 : 0,
                    bottom: 5),
                child: Text(
                  content,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: _sizeOf(content)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...note.tags!
                        .map((e) => _buildChips(e, note.color ?? Colors.white))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: note.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.network(note.imageUrl!),
    );
  }

  _buildChips(String tag, Color color) {
    return FittedBox(
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: _getComplementColor(color).withAlpha(20),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26, width: 1)),
        child: Center(
            child: Text(
          tag,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        )),
      ),
    );

/*
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.zero,
      labelStyle: const TextStyle(fontSize: 11),
      label: Text(tag),
      backgroundColor: color.withAlpha(50),
    );
*/
  }

  _sizeOf(String content) {
    var length = content.length;
    double size = 15;
    if (length < 20) size = 27;
    return size;
  }

  Color _getComplementColor(Color color) {
    int alpha = color.alpha;
    int red = color.red;
    int blue = color.blue;
    int green = color.green;

    // find compliments
    red = (~red) & 0xff;
    blue = (~blue) & 0xff;
    green = (~green) & 0xff;

    return Color.fromARGB(alpha, red, green, blue);
  }
}
