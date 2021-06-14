import 'package:gtech_flutter/core/controller/api.dart';
import 'package:gtech_flutter/model/photos_model.dart';
import 'package:gtech_flutter/widgets/photo_tile.dart';
import 'package:flutter/material.dart';

class PhotoGrid extends StatefulWidget {
  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    PhotosAPI _photosAPI = PhotosAPI();

    List<PhotosModel> _tempPhotosData =
        await _photosAPI.fetchPhotos().catchError(
              // ignore: invalid_return_type_for_catch_error
              (err) => print(err),
            );

    setState(() => _photosData = _tempPhotosData);

    print("object");
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _photosData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
      itemBuilder: (ctx, index) => PhotoTile(
        url: _photosData[index].imgURL,
      ),
    );
  }
}
