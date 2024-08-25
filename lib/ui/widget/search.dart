// import 'package:flutter/material.dart';
// import 'package:movies_animation/buesiness_logic/cubit/movies_cubit.dart';
// import 'package:movies_animation/data_/model/movies_model.dart';

// class SearchMovies extends StatefulWidget {
//   SearchMovies({super.key});

//   @override
//   State<SearchMovies> createState() => _SearchMoviesState();
// }

// class _SearchMoviesState extends State<SearchMovies> {
//   late List<model> allMovies = [];

//   late List<model> search = [];

//   bool _isSearch = false;

//   final _searchTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _searchTextController,
//       cursorColor: Color.fromRGBO(242, 97, 17, 1),
//       decoration: InputDecoration(
//           hintText: 'Find a Movie...',
//           border: InputBorder.none,
//           hintStyle: TextStyle(color: Colors.white, fontSize: 18)),
//       style: TextStyle(color: Colors.white, fontSize: 18),
//       onChanged: (SearchMovies) {
//         //عشان يظهر البحث بأول حرف يكتبه المستخدم
//         addSearchForItemsToSearch(SearchMovies);
//       },
//     );
//   }

//   void addSearchForItemsToSearch(String searchText) {
//     search.clear();
//     search.addAll(allMovies
//         .where((movie) => movie.title!.toLowerCase().startsWith(searchText))
//         .toList());
//     setState(() {});
//   }

//   List<Widget> buildAppBarAction() {
//     if (_isSearch) {
//       return [
//         IconButton(
//           onPressed: () {
//             _clearSearch();
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.clear,
//             color: Color.fromRGBO(242, 97, 17, 1),
//           ),
//         )
//       ];
//     } else {
//       return [
//         IconButton(
//             onPressed: _startSearch,
//             icon: Icon(
//               Icons.search,
//               color: Color.fromRGBO(242, 97, 17, 1),
//             ))
//       ];
//     }
//   }

// //
//   void _startSearch() {
//     ModalRoute.of(context)!.addLocalHistoryEntry(
//       LocalHistoryEntry(onRemove: _stopSearching),
//     );

//     setState(() {
//       _isSearch = true;
//     });
//   }

//   void _stopSearching() {
//     _clearSearch();

//     setState(() {
//       _isSearch = false;
//     });
//   }

// //يمسح الداتا ،يرجع اللسته الاصليه
//   _clearSearch() {
//     setState(() {
//       _searchTextController.clear();
//     });
//   }
// }

// class buildAppBarTitle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Movies',
//       style: TextStyle(color: Colors.white, fontSize: 25),
//     );
//   }
// }
