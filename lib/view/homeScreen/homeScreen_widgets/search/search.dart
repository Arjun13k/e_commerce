import 'package:e_commerce/contoller/search_controller/search_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchData extends StatefulWidget {
  const SearchData({super.key});

  @override
  State<SearchData> createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchCOntroller>(context);
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search for products",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      // Call the provider's search function
                      searchProvider.searchProducts(searchController.text);
                    }
                  },
                ),
              ),
            ),
          ),
          searchProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : searchProvider.searchResults.isEmpty
                  ? Center(child: Text("No results found"))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: searchProvider.searchResults.length,
                        itemBuilder: (context, index) {
                          final product = searchProvider.searchResults[index];
                          return ListTile(
                            title: Text(product['title']),
                            subtitle: Text("\$${product['price']}"),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
