import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/common_controllers/image_nasa_controller.dart';
import '../../models/common_models/image_nasa_model.dart';
import '../../utilities/constants.dart';

class ImageNasaWidget extends StatelessWidget {
  const ImageNasaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageNasaController imageNasaController = Get.find();

    return Obx(() {
      if (imageNasaController.images.isEmpty) {
        imageNasaController.fetchImages();
        return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        );
      } else if (imageNasaController.images.isNotEmpty) {
        return ImageNasaListWidget(imageList: imageNasaController.images);
      } else {
        return const Text('No images available.');
      }
    });
  }
}

class ImageNasaListWidget extends StatelessWidget {
  final List<ImageNasaModel> imageList;
  const ImageNasaListWidget({Key? key, required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 125.h,
            child: ListView.builder(
              itemCount: imageList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final nasaImage = imageList[index];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: kDefaultPadding + 4),
                      child: Image.network(
                        nasaImage.hdurl,
                        width: 170.w,
                        height: 125.h,
                      ),
                    ),
                    Positioned(
                      left: 15.w,
                      bottom: 10.h,
                      child: SizedBox(
                        width: 100.w,
                        child: Text(
                          nasaImage.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: kBoldText(12.sp, kFreudFont),
                        ),
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
  }
}
