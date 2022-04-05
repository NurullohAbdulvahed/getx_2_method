import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_2_method/models/post_model.dart';
import 'package:getx_2_method/pages/create_page.dart';
import 'package:getx_2_method/pages/edit_page.dart';
import 'package:getx_2_method/services/http_service.dart';


class HomeController extends GetxController{
  RxBool isLoading = false.obs;
  RxList  items = <Post>[].obs;

  Future<void> apiPostList() async {
    isLoading(true);
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      _showResponse(response!),
    });
  }

  void _showResponse(String response) {
    List<Post> list = Network.parsePostList(response);
    items.clear();
    isLoading(false);
    items.value = list;

  }

  void apiPostDelete(Post post) async {
    isLoading(true);
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      items.remove(post);
    }
    isLoading(false);
  }

  void goToCreatePage(BuildContext context) async{
    String? result = await Get.to(() => const CreatePage());
    if(result != null){
      items.add(Network.parsePost(result));
    }
  }


  void goToEditPage(Post post,BuildContext context) async{
    String? result =await Get.to(() => EditPage(post: post,));
    if(result != null){
      Post newPost = Network.parsePost(result);
      items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    }
  }
}