import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopper/api/firebase/firebase.dart';
import 'package:shopper/api/product/product_api.dart';
import 'package:shopper/models/models.dart';

class ProductFirebaseApi extends ProductApi {
  final db = FirebaseFirestore.instance;
  @override
  Future<List<Product>> fetchProducts({int page = 0}) async {
    // var docs = <Product>[
    //   Product(
    //     id: Uuid().v4(),
    //     image:
    //         'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-space-gray-select-201810?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1664472289661',
    //     title: 'Macbook Air 13`',
    //     price: 1500,
    //     rating: 4,
    //     description:
    //         'Apple M1 chip M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU, I‍/‍O and every other significant component and controller onto a single tiny chip. Speed through everyday jobs while using far less energy Unified Memory The more unified memory (RAM) you choose, the more apps you can run simultaneously with a higher rate of performance. The MacBook Air with M1 chip can be configured with up to 16GB for more fluid multitasking and easy handling of large files. Storage Solid-state drive (SSD) storage is the amount of space your MacBook Air has for your documents, photos, music, videos and other files. It delivers significant performance and speed that you’ll notice when you start up your Mac, launch an app or browse your photos.',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image: 'https://vikna.tv/wp-content/uploads/2023/07/26/iphone.jpg',
    //     title: 'iPhone 15',
    //     price: 800,
    //     rating: 4,
    //     description:
    //         'A16 Bionic chip with 5-core GPU, Advanced dual-camera system, 48MP Main camera 2x Telephoto, Ultra Wide camera, Up to 26 hours video playback20',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image:
    //         'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT5Y3ref_VW_34FR+watch-49-titanium-ultra2_VW_34FR+watch-face-49-trail-ultra2_VW_34FR?wid=2000&hei=2000&fmt=png-alpha&.v=1694507270905',
    //     title: 'Apple watch',
    //     price: 500,
    //     rating: 4,
    //     description:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image:
    //         'https://skay.ua/109665-thickbox_default/besprovodnye-naushniki-apple-airpods-max-space-gray-mgyh3.jpg',
    //     title: 'Air Pods Max',
    //     price: 900,
    //     rating: 4,
    //     description:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image:
    //         'https://eplio.com.ua/image/cache/catalog/product_1568_0_image-1000x1000.jpg',
    //     title: 'Magic mouse 2',
    //     price: 300,
    //     rating: 4,
    //     description:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image:
    //         'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-space-gray-select-201810?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1664472289661',
    //     title: 'Macbook Air 13` 256',
    //     price: 1900,
    //     rating: 4,
    //     description:
    //         'Apple M1 chip M1 brings incredible performance, custom technologies and amazing power efficiency to MacBook Air. Packed with 16 billion transistors, it integrates the CPU, GPU, I‍/‍O and every other significant component and controller onto a single tiny chip. Speed through everyday jobs while using far less energy Unified Memory The more unified memory (RAM) you choose, the more apps you can run simultaneously with a higher rate of performance. The MacBook Air with M1 chip can be configured with up to 16GB for more fluid multitasking and easy handling of large files. Storage Solid-state drive (SSD) storage is the amount of space your MacBook Air has for your documents, photos, music, videos and other files. It delivers significant performance and speed that you’ll notice when you start up your Mac, launch an app or browse your photos.',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image: 'https://vikna.tv/wp-content/uploads/2023/07/26/iphone.jpg',
    //     title: 'iPhone 15 128',
    //     price: 1100,
    //     rating: 4,
    //     description:
    //         'A16 Bionic chip with 5-core GPU, Advanced dual-camera system, 48MP Main camera 2x Telephoto, Ultra Wide camera, Up to 26 hours video playback20',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image:
    //         'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT5Y3ref_VW_34FR+watch-49-titanium-ultra2_VW_34FR+watch-face-49-trail-ultra2_VW_34FR?wid=2000&hei=2000&fmt=png-alpha&.v=1694507270905',
    //     title: 'Apple watch 128',
    //     price: 900,
    //     rating: 4,
    //     description:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    //     // isFavorite: false
    //   ),
    //   Product(
    //     id: Uuid().v4(),
    //     image:
    //         'https://skay.ua/109665-thickbox_default/besprovodnye-naushniki-apple-airpods-max-space-gray-mgyh3.jpg',
    //     title: 'Air Pods Max',
    //     price: 900,
    //     rating: 4,
    //     description:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    //     // isFavorite: false
    //   ),
    // ];

    // for (Product document in docs) {
    //   await db
    //       .collection(FirebaseDbKeys.products)
    //       .doc(document.id)
    //       .set(document.toJson());
    // }

    await Future.delayed(const Duration(seconds: 5));

    final event = await db.collection(FirebaseDbKeys.products).get();
    List<Product> products = [];
    for (var doc in event.docs) {
      products.add(Product.fromJson(doc.data()));
    }
    return products;
  }

  @override
  Future<Product> fetchProduct(String id) async {
    final event = await db.collection(FirebaseDbKeys.products).doc(id).get();
    if (event.exists) {
      return Product.fromJson(event.data()!);
    } else {
      throw Error();
    }
  }
}
