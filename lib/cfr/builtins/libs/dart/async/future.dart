import 'dart:async';
import 'dart:core';

import 'package:hydro_sdk/cfr/runtimeSupport.dart';

class VMManagedFuture extends VMManagedBox<Future<dynamic>> {
  VMManagedFuture(
      {required this.table, required this.vmObject, required this.hydroState})
      : super(
          table: table,
          vmObject: vmObject,
          hydroState: hydroState,
        ) {
    table['then'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedonValue = luaCallerArguments[1];
      Closure? unpackedOnError = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['onError']
          : null;
      return [
        maybeBoxObject<Future>(
            object: vmObject.then(
                (value) => ((val) =>
                        val != null && val.length >= 1 ? val[0] : null)(
                    maybeUnBoxAndBuildArgument<FutureOr<dynamic>, dynamic>(
                        unpackedonValue.dispatch(
                          [luaCallerArguments[0], value],
                          parentState: hydroState,
                        ),
                        parentState: hydroState)),
                onError: unpackedOnError != null
                    ? (err, stackTrace) => unpackedOnError.dispatch(
                          [luaCallerArguments[0], err, stackTrace],
                          parentState: hydroState,
                        )
                    : null),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['catchError'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedOnError = luaCallerArguments[1];
      Closure? unpackedtest =
          luaCallerArguments.length >= 3 ? luaCallerArguments[2]['test'] : null;
      return [
        maybeBoxObject<Future>(
            object: vmObject.catchError(
                (err, stackTrace) => unpackedOnError.dispatch(
                      [luaCallerArguments[0], err, stackTrace],
                      parentState: hydroState,
                    ),
                test: unpackedtest != null
                    ? (error) => unpackedtest.dispatch(
                          [luaCallerArguments[0], error],
                          parentState: hydroState,
                        )[0]
                    : null),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['whenComplete'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure unpackedaction = luaCallerArguments[1];
      return [
        maybeBoxObject<Future>(
            object: vmObject.whenComplete(
                () => maybeUnBoxAndBuildArgument<FutureOr<void>, void>(
                    unpackedaction.dispatch(
                      [
                        luaCallerArguments[0],
                      ],
                      parentState: hydroState,
                    )[0],
                    parentState: hydroState)),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['asStream'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      return [
        maybeBoxObject<Stream>(
            object: vmObject.asStream(),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
    table['timeout'] =
        makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      Closure? unpackedonTimeout = luaCallerArguments.length >= 3
          ? luaCallerArguments[2]['onTimeout']
          : null;
      return [
        maybeBoxObject<Future>(
            object: vmObject.timeout(
                maybeUnBoxAndBuildArgument<Duration, dynamic>(
                    luaCallerArguments[1],
                    parentState: hydroState),
                onTimeout: unpackedonTimeout != null
                    ? () =>
                        maybeUnBoxAndBuildArgument<FutureOr<dynamic>, dynamic>(
                            unpackedonTimeout.dispatch(
                              [
                                luaCallerArguments[0],
                              ],
                              parentState: hydroState,
                            )[0],
                            parentState: hydroState)
                    : null),
            hydroState: hydroState,
            table: HydroTable()),
      ];
    });
  }

  final HydroTable table;

  final HydroState hydroState;

  final Future vmObject;
}

void loadFuture({required HydroState hydroState, required HydroTable table}) {
  table['future'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    Closure unpackedcomputation = luaCallerArguments[1];
    return [
      maybeBoxObject<Future>(
          object: Future(
              () => maybeUnBoxAndBuildArgument<FutureOr<dynamic>, dynamic>(
                  unpackedcomputation.dispatch(
                    [
                      luaCallerArguments[0],
                    ],
                    parentState: hydroState,
                  )[0],
                  parentState: hydroState)),
          hydroState: hydroState,
          table: luaCallerArguments[0])
    ];
  });
  table['futureMicrotask'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    Closure unpackedcomputation = luaCallerArguments[1];
    return [
      maybeBoxObject<Future>(
          object: Future.microtask(
              () => maybeUnBoxAndBuildArgument<FutureOr<dynamic>, dynamic>(
                  unpackedcomputation.dispatch(
                    [
                      luaCallerArguments[0],
                    ],
                    parentState: hydroState,
                  )[0],
                  parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureSync'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    Closure unpackedcomputation = luaCallerArguments[1];
    return [
      maybeBoxObject<Future>(
          object: Future.sync(
              () => maybeUnBoxAndBuildArgument<FutureOr<dynamic>, dynamic>(
                  unpackedcomputation.dispatch(
                    [
                      luaCallerArguments[0],
                    ],
                    parentState: hydroState,
                  )[0],
                  parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureValue'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      maybeBoxObject<Future>(
          object: Future.value(
              maybeUnBoxAndBuildArgument<FutureOr<dynamic>?, dynamic>(
                  luaCallerArguments[1],
                  parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureError'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      maybeBoxObject<Future>(
          object: Future.error(
              maybeUnBoxAndBuildArgument<Object, dynamic>(luaCallerArguments[1],
                  parentState: hydroState),
              maybeUnBoxAndBuildArgument<StackTrace?, dynamic>(
                  luaCallerArguments[2],
                  parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureDelayed'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    Closure? unpackedcomputation = luaCallerArguments[2];
    return [
      maybeBoxObject<Future>(
          object: Future.delayed(
              maybeUnBoxAndBuildArgument<Duration, dynamic>(
                  luaCallerArguments[1],
                  parentState: hydroState),
              unpackedcomputation != null
                  ? () =>
                      maybeUnBoxAndBuildArgument<FutureOr<dynamic>, dynamic>(
                          unpackedcomputation.dispatch(
                            [
                              luaCallerArguments[0],
                            ],
                            parentState: hydroState,
                          )[0],
                          parentState: hydroState)
                  : null),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureWait'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    Closure? unpackedcleanUp = luaCallerArguments.length >= 3
        ? luaCallerArguments[2]['cleanUp']
        : null;
    return [
      maybeBoxObject<Future>(
          object: Future.wait(
              maybeUnBoxAndBuildArgument<Iterable<Future<dynamic>>,
                      Future<dynamic>>(luaCallerArguments[1],
                  parentState: hydroState),
              cleanUp: unpackedcleanUp != null
                  ? (successValue) => unpackedcleanUp.dispatch(
                        [luaCallerArguments[0], successValue],
                        parentState: hydroState,
                      )
                  : null,
              eagerError: luaCallerArguments.length >= 3
                  ? luaCallerArguments[2]['eagerError']
                  : null),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureAny'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      maybeBoxObject<Future>(
          object: Future.any(maybeUnBoxAndBuildArgument<
              Iterable<Future<dynamic>>,
              Future<dynamic>>(luaCallerArguments[1], parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureForEach'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    Closure unpackedaction = luaCallerArguments[2];
    return [
      maybeBoxObject<Future>(
          object: Future.forEach(
              maybeUnBoxAndBuildArgument<Iterable<dynamic>, dynamic>(
                  luaCallerArguments[1],
                  parentState: hydroState),
              (element) =>
                  maybeUnBoxAndBuildArgument<FutureOr<dynamic>, dynamic>(
                      unpackedaction.dispatch(
                        [luaCallerArguments[0], element],
                        parentState: hydroState,
                      )[0],
                      parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  table['futureDoWhile'] =
      makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    Closure unpackedaction = luaCallerArguments[1];
    return [
      maybeBoxObject<Future>(
          object: Future.doWhile(
              () => maybeUnBoxAndBuildArgument<FutureOr<bool>, bool>(
                  unpackedaction.dispatch(
                    [
                      luaCallerArguments[0],
                    ],
                    parentState: hydroState,
                  )[0],
                  parentState: hydroState)),
          hydroState: hydroState,
          table: HydroTable()),
    ];
  });
  registerBoxer<Future>(boxer: (
      {required Future vmObject,
      required HydroState hydroState,
      required HydroTable table}) {
    return VMManagedFuture(
        vmObject: vmObject, hydroState: hydroState, table: table);
  });
}
