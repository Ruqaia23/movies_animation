import 'package:flutter/material.dart';
import 'package:movies_animation/buesiness_logic/cubit/movies_cubit.dart';
import 'package:movies_animation/data_/model/movies_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_animation/ui/widget/Movies_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<model>? allMovies;

  void initState() {
    super.initState();
    allMovies = BlocProvider.of<MoviesCubit>(context).getAllMovies();
  }

  Widget buildBlocwidght() {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
//اذا تحملت البيانات
      if (state is MoviesLoaded) {
        allMovies = (state).movies;
        return buildLoadedList();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Color.fromRGBO(242, 97, 17, 1),
      ),
    );
  }

//عرض البوسترات داخل الشاشه الرئيسيه
  buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(4, 2, 24, 1),
        child: Column(
          children: [
            //نعرضها في كلاس ثاني
            buildMoviesList(),
          ],
        ),
      ),
    );
  }

  buildMoviesList() {
    //ترتيب الصور في القريد
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //عددهم
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allMovies!.length,
        itemBuilder: (ctx, i) {
          return MoviesItems(
            movie: allMovies![i],
          );
        });
  }

//الاساسيه
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(4, 2, 24, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(4, 2, 24, 1),
        title: Text(
          'Movies',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: buildBlocwidght(),
    );
  }
}
