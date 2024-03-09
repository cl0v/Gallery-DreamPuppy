import 'package:gallery/src/modules/gallery/domain/gallery_card_entity.dart';

/// Todos os possíveis estados do grid na galeria.
abstract class GalleryGridState {}

/// Adiciona os cards
class GalleryGridUpdateCards implements GalleryGridState {
  final List<GalleryCardEntity> cards;

  const GalleryGridUpdateCards(this.cards);
}

/// Informa quantos imagens estão por vir!
class GalleryGridUpdatePendingProgressIndicators implements GalleryGridState {
  final int amount;

  const GalleryGridUpdatePendingProgressIndicators(this.amount);
}

/// Exibe erros, avisos, logs, etc...
class GalleryGridInform implements GalleryGridState {
  final int code;
  final String message;
  final dynamic extras;

  GalleryGridInform(
    this.code, {
    required this.message,
    required this.extras,
  });
}

class GalleryGridInformError extends GalleryGridInform {
  GalleryGridInformError(
    super.code, {
    required super.message,
    required super.extras,
  });
}

class GalleryGridInformWarning extends GalleryGridInform {
  GalleryGridInformWarning(
    super.code, {
    required super.message,
    required super.extras,
  });
}