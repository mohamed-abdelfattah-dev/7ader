import '../models/category_model.dart';
import '../models/place_model.dart';
import '../models/product_model.dart';

class HomeDummyData {
  static const List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'مطاعم',
      imageUrl:
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=400&q=80',
    ),
    CategoryModel(
      id: '2',
      name: 'كافيهات',
      imageUrl:
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=400&q=80',
    ),
    CategoryModel(
      id: '3',
      name: 'سوبر ماركت',
      imageUrl:
          'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=400&q=80',
    ),
    CategoryModel(
      id: '4',
      name: 'حلويات',
      imageUrl:
          'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=400&q=80',
    ),
    CategoryModel(
      id: '5',
      name: 'منزلي',
      imageUrl:
          'https://images.unsplash.com/photo-1556910103-1c02745aae4d?auto=format&fit=crop&w=400&q=80',
    ),
    CategoryModel(
      id: '6',
      name: 'عطارة',
      imageUrl:
          'https://images.unsplash.com/photo-1513201099705-a9746e1e201f?auto=format&fit=crop&w=400&q=80',
    ),
  ];

  static const List<PlaceModel> places = [
    PlaceModel(
      id: 'p1',
      name: 'كبدة البرنس - Al Prince',
      imageUrl:
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=800&q=80',
      description:
          'أشهر مطعم كبدة وبرنس في مصر، طعم زمان بجودة عالية وتجربة فريدة في قلب إمبابة.',
      rating: 4.9,
      reviewCount: 15200,
      services: ['أكل في المكان', 'توصيل'],
      offers: ['وجبة البرنس العائلية بخصم 10%'],
      categoryId: '1',
    ),
    PlaceModel(
      id: 'p2',
      name: 'كشري أبو طارق - Abou Tarek',
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=800&q=80',
      description:
          'أشهر طبق كشري في العالم، طعم مصري أصيل لا يُنسى منذ عام 1950.',
      rating: 4.8,
      reviewCount: 25000,
      services: ['أكل في المكان', 'توصيل', 'تيك أواي'],
      offers: ['الحلو هدية على كل علبة كشري جامبو'],
      categoryId: '1',
    ),
    PlaceModel(
      id: 'p3',
      name: 'قصر الكبابجي - Al Kababgy',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=800&q=80',
      description:
          'ملوك المشويات في مصر، نقدم أفخم أنواع اللحوم المشوية على الفحم بأعلى جودة.',
      rating: 4.9,
      reviewCount: 8500,
      services: ['أكل في المكان', 'توصيل', 'حفلات'],
      offers: ['توصيل مجاني للطلبات الكبيرة'],
      categoryId: '1',
    ),
    PlaceModel(
      id: 'p4',
      name: 'بلبن - B.Laban',
      imageUrl:
          'https://images.unsplash.com/photo-1588195538326-c5b1e9f80a1b?auto=format&fit=crop&w=800&q=80',
      description:
          'أصل القنبلة والرز بلبن في مصر، بنحول الحلويات التقليدية لإبداع عالمي.',
      rating: 4.7,
      reviewCount: 12000,
      services: ['تيك أواي', 'توصيل'],
      offers: ['جرب القنبلة الجديدة بخصم 15%'],
      categoryId: '4',
    ),
  ];

  static const List<ProductModel> products = [
    ProductModel(
      id: '101',
      name: 'كبدة باللية الضاني',
      description:
          'كبدة بلدي طازجة مشوحة باللية الضاني والفلفل الحار، تقدم مع سلطة وخطر عيش سخن.',
      price: 185.0,
      imageUrl:
          'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=600&q=80',
      categoryId: '1',
      placeId: 'p1',
      rating: 4.9,
      reviewCount: 3200,
    ),
    ProductModel(
      id: '102',
      name: 'طاجن عكاوي بالبصل',
      description:
          'طاجن عكاوي بلدي مطهو ببطء مع البصل المكرمل والتوابل المصرية السرية.',
      price: 350.0,
      imageUrl:
          'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=600&q=80',
      categoryId: '1',
      placeId: 'p1',
      rating: 4.8,
      reviewCount: 1500,
    ),
    ProductModel(
      id: '103',
      name: 'علبة كشري أبو طارق جامبو',
      description:
          'علبة كبيرة تحتوي على المكرونة، الأرز، العدس، الحمص، البصل المقرمش مع الصلصة والدقة.',
      price: 85.0,
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=600&q=80',
      categoryId: '1',
      placeId: 'p2',
      rating: 4.9,
      reviewCount: 8500,
    ),
    ProductModel(
      id: '104',
      name: 'طبق حلويات مشكل',
      description:
          'مجموعة من الحلويات الشرقية المصرية: بسبوسة، كنافة، وبلح الشام بالسمن البلدي.',
      price: 150.0,
      imageUrl:
          'https://images.unsplash.com/photo-1574071318508-1cdbad80ad38?auto=format&fit=crop&w=600&q=80',
      categoryId: '4',
      placeId: 'p4',
      rating: 4.9,
      reviewCount: 2300,
    ),
    ProductModel(
      id: '105',
      name: 'كيلو كباب وكفتة ضاني',
      description:
          'كيلو مشويات مشكل من أجود أنواع اللحوم الضاني المشوية على الفحم بالطريقة المصرية.',
      price: 650.0,
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=600&q=80',
      categoryId: '1',
      placeId: 'p3',
      rating: 4.9,
      reviewCount: 4500,
    ),
    ProductModel(
      id: '106',
      name: 'أرز بلبن بالمكسرات والقشطة',
      description: 'طبق أرز بلبن غني ومغلق بالقشطة الفلاحي والمكسرات الطازجة.',
      price: 65.0,
      imageUrl:
          'https://images.unsplash.com/photo-1578985545062-69923b3d0c64?auto=format&fit=crop&w=600&q=80',
      categoryId: '4',
      placeId: 'p4',
      rating: 4.8,
      reviewCount: 6200,
    ),
    ProductModel(
      id: '107',
      name: 'طاجن ملوخية بالتقلية',
      description:
          'ملوخية خضراء طازجة بـ "الطشة" المصرية الأصلية والتقلية الثوم والكزبرة.',
      price: 95.0,
      imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=600&q=80',
      categoryId: '1',
      placeId: 'p3',
      rating: 4.9,
      reviewCount: 3100,
    ),
    ProductModel(
      id: '108',
      name: 'فطير مشلتت فلاحي',
      description:
          'فطير مشلتت مورق ومعد بالسمن البلدي في الفرن الفلاحي، يقدم مع عسل أسود وطحينة.',
      price: 145.0,
      imageUrl:
          'https://images.unsplash.com/photo-1556910103-1c02745aae4d?auto=format&fit=crop&w=600&q=80',
      categoryId: '1',
      placeId: 'p1',
      rating: 4.6,
      reviewCount: 4200,
    ),
  ];
}
