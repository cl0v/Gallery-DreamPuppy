import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gallery/src/modules/puppy/data/datasource.dart';

import '../../domain/entities/pet_details.dart';

class FetchPuppyEvent {
  int id;
  FetchPuppyEvent({
    required this.id,
  });
}

abstract class PuppyDetailsState {}

class FetchPuppyLoadingState extends PuppyDetailsState {}

class FetchPuppySuccessState extends PuppyDetailsState {
  PuppyDetailsEntity entity;

  FetchPuppySuccessState(this.entity);
}

class PuppyDetailsBloc extends Bloc<FetchPuppyEvent, PuppyDetailsState> {
  final PuppyDetailsDatasource datasource;

  PuppyDetailsBloc(super.initialState, {required this.datasource}) {
    on<FetchPuppyEvent>(fetch);
  }

  FutureOr<void> fetch(
    FetchPuppyEvent event,
    Emitter<PuppyDetailsState> emit,
  ) async {
    var (res, err) = await datasource.getDetails(event.id);
    if (err != null) {
      //TODO: Corrigir isso;
      return;
    }
    res = res!;

    return emit(FetchPuppySuccessState(res));
  }
}
