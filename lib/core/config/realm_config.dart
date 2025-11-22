import 'package:realm/realm.dart';
import 'package:to_do_flutter/features/home/model/task_model.dart';

late Realm realm;
void initRealm() {
  final config = Configuration.local([TaskModel.schema]);

  realm = Realm(config);
}
