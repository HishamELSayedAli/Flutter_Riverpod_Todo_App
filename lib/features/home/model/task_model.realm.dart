// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class TaskModel extends _TaskModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TaskModel(
    ObjectId id,
    String title,
    String subtitle,
    String dueDate, {
    bool isArchieved = false,
    bool isDone = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TaskModel>({
        'isArchieved': false,
        'isDone': false,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'subtitle', subtitle);
    RealmObjectBase.set(this, 'dueDate', dueDate);
    RealmObjectBase.set(this, 'isArchieved', isArchieved);
    RealmObjectBase.set(this, 'isDone', isDone);
  }

  TaskModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get subtitle =>
      RealmObjectBase.get<String>(this, 'subtitle') as String;
  @override
  set subtitle(String value) => RealmObjectBase.set(this, 'subtitle', value);

  @override
  String get dueDate => RealmObjectBase.get<String>(this, 'dueDate') as String;
  @override
  set dueDate(String value) => RealmObjectBase.set(this, 'dueDate', value);

  @override
  bool get isArchieved =>
      RealmObjectBase.get<bool>(this, 'isArchieved') as bool;
  @override
  set isArchieved(bool value) =>
      RealmObjectBase.set(this, 'isArchieved', value);

  @override
  bool get isDone => RealmObjectBase.get<bool>(this, 'isDone') as bool;
  @override
  set isDone(bool value) => RealmObjectBase.set(this, 'isDone', value);

  @override
  Stream<RealmObjectChanges<TaskModel>> get changes =>
      RealmObjectBase.getChanges<TaskModel>(this);

  @override
  Stream<RealmObjectChanges<TaskModel>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TaskModel>(this, keyPaths);

  @override
  TaskModel freeze() => RealmObjectBase.freezeObject<TaskModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'subtitle': subtitle.toEJson(),
      'dueDate': dueDate.toEJson(),
      'isArchieved': isArchieved.toEJson(),
      'isDone': isDone.toEJson(),
    };
  }

  static EJsonValue _toEJson(TaskModel value) => value.toEJson();
  static TaskModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'subtitle': EJsonValue subtitle,
        'dueDate': EJsonValue dueDate,
      } =>
        TaskModel(
          fromEJson(id),
          fromEJson(title),
          fromEJson(subtitle),
          fromEJson(dueDate),
          isArchieved: fromEJson(ejson['isArchieved'], defaultValue: false),
          isDone: fromEJson(ejson['isDone'], defaultValue: false),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TaskModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, TaskModel, 'TaskModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('subtitle', RealmPropertyType.string),
      SchemaProperty('dueDate', RealmPropertyType.string),
      SchemaProperty('isArchieved', RealmPropertyType.bool),
      SchemaProperty('isDone', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
