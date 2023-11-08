import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/gallery_card_entity.dart';

class FetchGalleryCards {
  final int amount;

  FetchGalleryCards({required this.amount});
}

abstract class GalleryPageState {}

class GalleryPageLoadingState implements GalleryPageState {}

class GalleryPageSuccessState implements GalleryPageState {
  final List<GalleryCardEntity> cards;

  GalleryPageSuccessState(this.cards);
}

class GalleryPageFailureState implements GalleryPageState {
  final String message;
  final int code;

  GalleryPageFailureState({
    required this.message,
    required this.code,
  });
}

class GalleryPageBloc extends Bloc<FetchGalleryCards, GalleryPageState> {
  GalleryPageBloc() : super(GalleryPageLoadingState()) {
    on<FetchGalleryCards>(fetch);
  }

  FutureOr<void> fetch(
      FetchGalleryCards event, Emitter<GalleryPageState> emit) {
    print(event.amount);
    emit(
      GalleryPageSuccessState(List.generate(
        event.amount,
        (index) => GalleryCardEntity(
          petId: index.toString(),
          imageUrl: 'https://i.imgur.com/pCZ6okx.jpeg',
        ),
      )),
    );
  }
}
