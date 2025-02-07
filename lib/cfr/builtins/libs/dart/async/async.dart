import 'package:hydro_sdk/cfr/builtins/libs/dart/async/asyncError.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/completer.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/deferredLoadException.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/eventSink.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/future.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/multiStreamController.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/stream.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamConsumer.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamController.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamIterator.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamSink.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamSubscription.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamTransformer.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamTransformerBase.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/streamView.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/synchronousStreamController.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/timeoutException.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/timer.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/zone.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/zoneDelegate.dart';
import 'package:hydro_sdk/cfr/builtins/libs/dart/async/zoneSpecification.dart';
import 'package:hydro_sdk/cfr/runtimeSupport.dart';

void loadasync({required HydroState hydroState, required HydroTable table}) {
  final async = HydroTable();
  table['async'] = async;
  loadAsyncError(table: async, hydroState: hydroState);
  loadFuture(table: async, hydroState: hydroState);
  loadTimeoutException(table: async, hydroState: hydroState);
  loadCompleter(table: async, hydroState: hydroState);
  loadStreamController(table: async, hydroState: hydroState);
  loadSynchronousStreamController(table: async, hydroState: hydroState);
  loadDeferredLoadException(table: async, hydroState: hydroState);
  loadStream(table: async, hydroState: hydroState);
  loadStreamSubscription(table: async, hydroState: hydroState);
  loadEventSink(table: async, hydroState: hydroState);
  loadStreamView(table: async, hydroState: hydroState);
  loadStreamConsumer(table: async, hydroState: hydroState);
  loadStreamSink(table: async, hydroState: hydroState);
  loadStreamTransformer(table: async, hydroState: hydroState);
  loadStreamTransformerBase(table: async, hydroState: hydroState);
  loadStreamIterator(table: async, hydroState: hydroState);
  loadMultiStreamController(table: async, hydroState: hydroState);
  loadTimer(table: async, hydroState: hydroState);
  loadZoneSpecification(table: async, hydroState: hydroState);
  loadZoneDelegate(table: async, hydroState: hydroState);
  loadZone(table: async, hydroState: hydroState);
}
