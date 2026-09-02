import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

Uuid uuid = const Uuid();

@freezed
abstract class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String id,
    required String desc,
    @Default(false) bool completed,
  }) = _TodoModel;

  factory TodoModel.add({required String desc}) {
    return TodoModel(id: uuid.v4(), desc: desc);
  }
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}

enum Filter { all, active, completed }
