// To parse this JSON data, do
//
//     final yesNoModel = yesNoModel.fromJson(json);

import 'package:yes_no_app/domain/entities/message.dart';

final answers = {"no": "No", "yes": "Si", "maybe": "Talvez"};

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
        text: answers[answer] ?? 'yes',
        from: From.She,
        imageUrl: image,
      );
}
