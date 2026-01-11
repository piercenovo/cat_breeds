import 'package:cat_breeds/i18n/translations.g.dart';
import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatBreedsListScreen extends StatefulWidget {
  const CatBreedsListScreen({super.key});

  @override
  State<CatBreedsListScreen> createState() => _CatBreedsListScreenState();
}

class _CatBreedsListScreenState extends State<CatBreedsListScreen>
    with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  bool _isSearching = false;
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      if (_isSearching) {
        _searchController.clear();
        _searchQuery = '';
      }
      _isSearching = !_isSearching;
    });
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value.trim().toLowerCase();
    });
  }

  Future<void> onRefresh() async {
    context.read<CatBreedsCubit>().fetchBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return CBBaseScreen(
      appBar: CBAppBar(
        title: texts.home.title,
        actions: [
          CBIconButton(
            iconData: _isSearching ? CatBreedIcons.x : CatBreedIcons.search,
            onPressed: _toggleSearch,
            color: Palette.brandPrimary,
          ),
        ],
        button: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isSearching
              ? Padding(
                  padding: edgeInsetsH16.add(edgeInsetsV8),
                  child: CBTextField(
                    controller: _searchController,
                    hintText: texts.home.search,
                    prefixIcon: CatBreedIcons.search,
                    onChanged: _onSearchChanged,
                    autofocus: true,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
      body: CustomMaterialIndicator(
        onRefresh: onRefresh,
        child: BlocBuilder<CatBreedsCubit, CatBreedsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => ListView.builder(
                padding: edgeInsetsV8.add(edgeInsetsH12),
                itemCount: 6,
                itemBuilder: (_, _) => const CatBreedCardShimmer(),
              ),

              error: (failure) => Center(child: Text(failure.toString())),
              success: (breeds) {
                final filteredBreeds = _searchQuery.isEmpty
                    ? breeds
                    : breeds
                          .where(
                            (b) => b.name.toLowerCase().contains(_searchQuery),
                          )
                          .toList();

                if (filteredBreeds.isEmpty) {
                  return Center(
                    child: SizedBox(
                      height: 160,
                      child: Column(
                        children: [
                          const SizedBox(
                            width: 120,
                            height: 120,
                            child: Icon(
                              Icons.pets,
                              size: 100,
                              color: Palette.neutral300,
                            ),
                          ),
                          Text(
                            texts.home.notFound,
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Palette.neutral400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: edgeInsetsV8.add(edgeInsetsH12),
                  itemCount: filteredBreeds.length,
                  itemBuilder: (context, index) {
                    final breed = filteredBreeds[index];
                    return CatBreedCard(
                      breed: breed,
                      onTap: () async {
                        await context.pushNamed(
                          Routes.catBreedDetail.name,
                          extra: breed,
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
