import 'package:equatable/equatable.dart';
import 'package:flutter_education_app_clean_bloc/gen/assets.gen.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });
  PageContent.first()
      : this(
          description: 'this app mafe by Clean Architecture to show my skills ',
          image: Assets.vectors.casualReading.path,
          title: 'Clean Architecture',
        );
  PageContent.second()
      : this(
          description: 'coding by very good analyizes style for cleaner code',
          image: Assets.vectors.casualLife.path,
          title: 'Very Good analyizes',
        );
  PageContent.third()
      : this(
          description:
              'The BackEnd of the app made by me using nodJS and mongoDB',
          image: Assets.vectors.casualMeditationScience.path,
          title: 'nodJS',
        );

  final String image;
  final String title;
  final String description;

  @override
  List<Object> get props => [image, title, description];
}
