
import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel>  category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "assets/t2.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "assets/t1.jpg";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "assets/t3.jpg";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "assets/t4.jpg";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "assets/t5.jpg";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "assets/t51.jpg";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "assets/t52.jpg";
  category.add(categoryModel);

  return category;
}