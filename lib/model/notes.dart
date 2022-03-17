import 'package:flutter/material.dart';

/// Author : Mohammad
/// 12/10/2021
/// project : keep-clone
class Note {
  final String title;
  final String? content;
  final List<String>? tags;
  final Color? color;
  final String? imageUrl;

  Note(
      {required this.title,
      this.content,
      this.color,
      this.imageUrl,
      this.tags});
}

var text1 =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
var text2 =
    "Qui totam velit et perferendis laborum sit quod odio est esse quis est rerum dignissimos quo deserunt explicabo et quaerat laboriosam. Ut quibusdam natus ea sunt internos ab dolores tenetur qui voluptatibus suscipit et natus consequatur vel autem molestias ad galisum ipsum. Id itaque facilis sed facilis veritatis id fuga odit eos nulla dolores aut numquam laboriosam. Et quisquam asperiores sed dolores veritatis ut praesentium quam.";
var text3 =
    "Sit quisquam ipsa id galisum iure et exercitationem aliquid ut deserunt dolores et aperiam dolores aut assumenda similique aut consequuntur accusantium. Ut expedita minus in recusandae quibusdam non eius consectetur et nihil quia. Vel quos voluptatem quo voluptatem voluptatum qui assumenda adipisci non mollitia enim.";
var text4 =
    "Id corporis sint non excepturi quam non doloremque veritatis et quia quis. Et sint ullam non molestias voluptatibus et iusto repellendus. Nam quis doloremque aut alias laborum quo tempora quam";
var text5 = "Flutter is Rocks";
var text6 = "a piece of written, printed, or electronic matter that provides information or evidence or that serves as an official record.";

List<Note> notes = [
  Note(
      title: "",
      content: text6,
      color: Colors.pink[50],
      imageUrl: "https://data2.unhcr.org/images/documents/big_aa2c81585e808b644ef70587136c23601d33a2e9.jpg",
      tags: ["document"]) ,
  Note(
      title: "Shopping",
      content: text1,
      color: Colors.orange[50],
      tags: ["grocery", "market"]),
  Note(
      title: "Diary",
      content: text2,
      color: Colors.blue[50],
      tags: ["personal"]),
  Note(title: "", content: text3, color: Colors.green[50], tags: []),
  Note(title: "Session", content: text4, color: Colors.red[50], tags: []),
  Note(
      title: "Fact",
      content: text5,
      color: Colors.cyan[50],
      tags: ["programming", "Dart", "Work"]),
  Note(
      title: "",
      content: "my poppy",
      color: Colors.deepOrange[50],
      imageUrl:
          "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_4x3.jpg",
      tags: ["Home", "Pet"]),
];
