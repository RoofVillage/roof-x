import 'dart:io';
import 'dart:collection';
import 'package:storage/index.dart';

import 'object.dart';

class Cache {
  SplayTreeMap _tempCacheMap;

  Future<File> save(ModelObject modelObject) async {
    if (_tempCacheMap != null) throw _batchWritingStateInterruptError;

    startBatchSaving();

    final modelCache = _readModelCache(_tempCacheMap, modelObject.runtimeType);
    //Updates the particular model object passed in.
    modelCache[modelObject] = modelObject.toMap();

    return await endBatchSaving();
  }

  void startBatchSaving() => _tempCacheMap = Storage.read;

  void continueBatchSaving<T extends ModelObject>(
      List<ModelObject> modelObjects) {
    final modelCache = _readModelCache(_tempCacheMap, T);

    for (var modelObject in modelObjects) {
      if (modelObject.runtimeType != T) continue;

      //Updates the particular model object passed in.
      modelCache[modelObject] = modelObject.toMap();
    }
    //Updates the cache.
    _tempCacheMap[T] = modelCache;
  }

  Future<File> endBatchSaving() async {
    if (_tempCacheMap == null) throw _batchWritingStateError;

    final file = Storage.write(_tempCacheMap);
    _tempCacheMap = null;
    return file;
  }

  T read<T extends ModelObject>(
      {String guid, T converter(Map<String, Object> map)}) {
    //Get the cache.
    final cache = Storage.read;

    //Get the cache.
    final modelCache = _readModelCache(cache, T);

    final map = modelCache[guid.hashCode];

    ///Get from server if null;

    return converter(map);
  }

  Map<ModelObject, Object> _readModelCache(SplayTreeMap cache, Type key) {
    //Get the sub-cache partaining to model objects of the passed in type. If it doesn't exist, create it.
    final modelObjectCache =
        cache[key] as Map<ModelObject, Object> ?? Map<ModelObject, Object>();

    return modelObjectCache;
  }

  final _batchWritingStateError =
      StateError("Batch writing is not in progress.");
  final _batchWritingStateInterruptError =
      StateError("Batch writing is in progress.");
}
