import '../../features/course/model/course.dart';

final _youWillLearn = List.generate(
    10,
    (_) =>
        'You will create a portfolio of 15 apps to be able apply for junior developer jobs at a technology company');

final courses = <LCourse>[
  LCourse(
    id: '1',
    name: 'Objective-C Crash Course for Swift Developers',
    description:
        'From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!',
    thumbnail: 'https://img-b.udemycdn.com/course/240x135/706020_6d7c_3.jpg',
    instructorName: 'Mark Wahlbeck',
    rating: 4.5,
    ratingCount: 785,
    price: 59.99,
    salePrice: 11.99,
    youWillLearn: _youWillLearn,
    category: 'mobile development',
  ),
  LCourse(
    id: '2',
    name: 'The Complete Android T + Java Developer Course™ : 2023',
    description:
        'From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!',
    thumbnail: 'https://img-b.udemycdn.com/course/240x135/900464_a431_22.jpg',
    instructorName: 'Morteza Kordi',
    rating: 4.4,
    ratingCount: 4389,
    price: 29.99,
    youWillLearn: _youWillLearn,
    category: 'mobile development',
  ),
  LCourse(
    id: '3',
    name: 'Android Java Masterclass - Become an App Developer',
    description:
        'From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!',
    thumbnail: 'https://img-b.udemycdn.com/course/240x135/919872_ed54_6.jpg',
    instructorName: 'Tim Buchalka',
    rating: 4.3,
    ratingCount: 10344,
    price: 59.99,
    salePrice: 19.99,
    youWillLearn: _youWillLearn,
    category: 'mobile development',
  ),
  LCourse(
    id: '4',
    name: 'Android Material Design',
    description:
        'From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!',
    thumbnail: 'https://img-b.udemycdn.com/course/240x135/921168_7646_2.jpg',
    instructorName: 'Anna Purrna Argawal Sidhartha',
    rating: 4.3,
    ratingCount: 10344,
    price: 59.99,
    salePrice: 19.99,
    youWillLearn: _youWillLearn,
    category: 'mobile development',
  ),
  LCourse(
    id: '5',
    name: 'Android Java Masterclass - Become an App Developer',
    description:
        'From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!',
    thumbnail: 'https://img-b.udemycdn.com/course/240x135/919872_ed54_6.jpg',
    instructorName: 'Tim Buchalka',
    rating: 4.3,
    ratingCount: 10344,
    price: 59.99,
    salePrice: 19.99,
    youWillLearn: _youWillLearn,
    category: 'mobile development',
  ),
  LCourse(
    id: '6',
    name: 'The Complete Android 12 & Kotlin Development Masterclass',
    description:
        'From Beginner to iOS App Developer with Just One Course! Fully Updated with a Comprehensive Module Dedicated to SwiftUI!',
    thumbnail: 'https://img-b.udemycdn.com/course/480x270/1829188_efd3_5.jpg',
    instructorName: 'Anushka Madusanka',
    rating: 4.2,
    ratingCount: 24279,
    price: 89.0,
    salePrice: 9.9,
    youWillLearn: _youWillLearn,
    category: 'mobile development',
  )
];
