import 'package:get/get.dart';
import 'package:movies_app/core/Services/api.dart';
import 'package:movies_app/data/Models/genres.dart';

class GenerController extends GetxController {
  List genres = <Genre>[];
  Future getGenres() async {
    var response = await Api.getGenres();
    var genreRespone = GenreResponse.fromJson(response.data);
    genres.clear();
    genres.addAll(genreRespone.genres);
  }

  @override
  void onInit() async {
    await getGenres();
    // TODO: implement onInit
    super.onInit();
  }
}
