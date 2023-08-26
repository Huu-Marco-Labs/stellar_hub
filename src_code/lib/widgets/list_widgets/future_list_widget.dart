import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../models/nasa_models/image_nasa_model.dart';
import '../../services/nasa_services/image_nasa_services.dart';

FutureBuilder<List<ImageNasaModel>> futureListWidget() {
  final ImageNasaService imageNasaService = ImageNasaService();

  return FutureBuilder<List<ImageNasaModel>>(
    future: imageNasaService.getLast3ImagesOfTheDay(),
    initialData: const [],
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        );
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final images = snapshot.data!;
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 125.h,
                child: ListView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final nasaImage = images[index];
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: kDefaultPadding + 3),
                          child: Image.network(nasaImage.hdurl),
                        ),
                        Positioned(
                          left: 0.w,
                          bottom: 6.h,
                          child: Text(
                            nasaImage.title,
                            style: kBoldText(12.sp, kFreudFont),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      } else {
        return const Text('No images available.');
      }
    },
  );
}
