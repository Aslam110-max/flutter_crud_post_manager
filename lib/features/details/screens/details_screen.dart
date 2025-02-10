import 'package:flutter/material.dart';
import 'package:flutter_crud_post_manager/common/widgets/custom_app_bar.dart';
import 'package:flutter_crud_post_manager/common/widgets/custom_button.dart';
import 'package:flutter_crud_post_manager/common/widgets/custom_cupertino.dart';
import 'package:flutter_crud_post_manager/common/widgets/custom_text_field.dart';
import 'package:flutter_crud_post_manager/features/details/controller/details_controller.dart';
import 'package:flutter_crud_post_manager/features/home/domain/models/post_model.dart';
import 'package:flutter_crud_post_manager/util/dimensions.dart';
import 'package:flutter_crud_post_manager/util/styles.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  final PostModel? post;
  const DetailsScreen({super.key, this.post});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.post != null) {
      userIdController.text = "${widget.post!.userId}";
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (detailsController) {
      return Scaffold(
        appBar: CustomAppBar(
          deleteButton: widget.post != null,
          id:widget.post?.id ,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Id",
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      color: Colors.white),
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'User Id cannot be empty';
                    }
                    return null;
                  },
                  controller: userIdController,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Title",
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      color: Colors.white),
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                  controller: titleController,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Body",
                  style: robotoMedium.copyWith(
                      fontSize: Dimensions.fontSizeExtraLarge,
                      color: Colors.white),
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Body cannot be empty';
                    }
                    return null;
                  },
                  maxLines: 8,
                  controller: bodyController,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  isLoading: detailsController.isLoading,
                  buttonText: widget.post != null ? "Update Item" : "Add Item",
                  onPressed: widget.post != null
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            showCurpertinoDialog(context, "Are you sure?",
                                "Do you want to update current post", () {
                              PostModel updatedPostModel = PostModel(
                                  userId: int.parse(userIdController.text),
                                  id: widget.post!.id,
                                  title: titleController.text,
                                  body: bodyController.text);
                              detailsController.updatePost(
                                  widget.post!.id, updatedPostModel);
                            });
                          }
                        }
                      : () {
                         if (_formKey.currentState!.validate()) {
                            showCurpertinoDialog(context, "Are you sure?",
                                "Do you want to add current post", () {
                              PostModel newPostModel = PostModel(
                                  userId: int.parse(userIdController.text),
                                  id: 0,
                                  title: titleController.text,
                                  body: bodyController.text);
                              detailsController.addPost(newPostModel);
                            });
                          }
                      },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
