abstract class CategoryEvent {}

class CategoryEventGetAll extends CategoryEvent {
  final int size;
  final int currentPage;

  CategoryEventGetAll({this.size, this.currentPage});
}
