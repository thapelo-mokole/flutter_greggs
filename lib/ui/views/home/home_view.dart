import 'package:flutter/material.dart';
import 'package:flutter_greggs_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Greggs',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              viewModel.isBusy
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 6,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.products.length,
                      itemBuilder: (context, index) {
                        final item = viewModel.products[index];

                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        item.articleName,
                                        style: const TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      subtitle:
                                          Text("Price: GBP ${item.eatInPrice}"),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              viewModel
                                                  .removeItem(item.articleCode);
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              viewModel.addItem(
                                                  item.articleCode,
                                                  item.articleName,
                                                  item.eatInPrice);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
              verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total Price: GBP ${viewModel.basketApiService.totalItems.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              verticalSpaceLarge,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  final items = viewModel.basketApiService.items.values
                      .toList(growable: false);

                  List<Widget> widgetList = [];

                  for (var item in items) {
                    widgetList.add(
                      ListTile(
                        title: Text(
                          item.name,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900),
                        ),
                        subtitle: Text("Quantity: ${item.quantity}"),
                      ),
                    );
                  }

                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: widgetList,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
