import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/feature/add_product/presentation/widgets/add_product_view_body.dart';

import '../../../../core/helper_function/custom_show_snake_bar.dart';
import '../../../../core/repos/add_product_repo/add_product_repo_impl.dart';
import '../../../../core/repos/upload_image_repo/upload_image_repo_impl.dart';
import '../../data/data_source/database_remote_data_source.dart';
import '../view_model/add_product_cubit.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddProductCubit(
            AddProductRepoImpl(DatabaseRemoteDataSourceImpl()),
            UploadImageRepoImpl(),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('لوحه التحكم', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff1B5E37),
        ),
        body: BlocConsumer<AddProductCubit, AddProductState>(
          listener: (context, state) {
            if (state is AddProductFailure) {
              customShowSnakeBar(
                  context, color: Colors.red, label: state.errMessage);
            }
            if (state is AddProductSuccess) {
              customShowSnakeBar(
                  context, color: Colors.green, label: 'تم الاضافه بنجاح');
            }
          },
          builder: (context, state) {
            return AddProductViewBody();
          },
        ),
      ),
    );
  }
}
