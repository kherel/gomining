import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class DependentCubit<M extends Cubit, L, C, T extends Equatable>
    extends Cubit<T> {
  DependentCubit(this.targetCubit, this.initState) : super(initState) {
    targetCubitSubscription = targetCubit.stream.listen(checkTargetStatus);
    initCheck();
  }

  T initState;

  void initCheck() {
    if (targetCubit.state is L) {
      load();
    }
  }

  void checkTargetStatus(targetState) {
    if (targetState is L) {
      load();
    } else if (targetState is C) {
      clear();
    }
  }

  late StreamSubscription targetCubitSubscription;
  final M targetCubit;

  void load();

  @protected
  @mustCallSuper
  FutureOr<void> clear() async {
    if (state == initState) return;
    emit(initState);
  }

  @override
  Future<void> close() {
    targetCubitSubscription.cancel();
    return super.close();
  }
}
