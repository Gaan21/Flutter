import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = "infinite_screen";

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 300) <=
          scrollController.position.maxScrollExtent) {
        loadNexPage();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNexPage() async {
    if (isLoading == true) return;
    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;

    final lastId = imagesIds.last;
    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastId);

    addFiveImages();
    setState(() {});
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: _ListViewImagenes(
              scrollController: scrollController, imagesIds: imagesIds),
        ),
      ),
      //Para colocar el boton:
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading == true
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded),
              )
            : FadeIn(
                child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
      ),
    );
  }
}

class _ListViewImagenes extends StatelessWidget {
  const _ListViewImagenes({
    super.key,
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: imagesIds.length,
      itemBuilder: (context, index) {
        return FadeInImage(
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
          placeholder: const AssetImage("assets/images/jar-loading.gif"),
          image: NetworkImage(
              "https://picsum.photos/id/${imagesIds[index]}/500/300"),
        );
      },
    );
  }
}
