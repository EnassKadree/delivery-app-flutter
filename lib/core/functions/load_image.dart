part of'functions.dart';


extension LoadImage on Functions
{
  Widget loadImage(String uri) {
    return Image.network(
      uri,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Icon(Iconsax.book_1);
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Iconsax.info_circle);
      },
      width: 32,
    );
  }
}