abstract class GalleryGridEvents {}

class GalleryGridFetchEvent implements GalleryGridEvents {
  final int amount;

  const GalleryGridFetchEvent(this.amount);
}

class GalleryGridCancelFetchEvent implements GalleryGridEvents {
  const GalleryGridCancelFetchEvent();
}
