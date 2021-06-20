import 'package:flutter/material.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/subtitle.dart';
import 'package:money_tracker/ui/pages/operation/list_tile_operation.dart';
import 'package:provider/provider.dart';

class LastOperations extends StatelessWidget {
  const LastOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Subtitle(
          leading:
              Text('History', style: Theme.of(context).textTheme.headline6),
        ),
        StreamBuilder<List<Operation>>(
            stream: context.read<Repository>().watchLastOperations(5),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                print(snapshot.error);
              }

              if (snapshot.data == null) {
                return SizedBox();
              }

              return Column(
                children: snapshot.data!
                    .map((e) => ListTileOperation(
                          e,
                          onTap: () {},
                        ))
                    .toList(),
              );
            }),
        Subtitle(
          onPress: () => PageNavigator.openOperationListPage(context),
          child: Text('Show all'),
        ),
      ],
    );
  }
}
