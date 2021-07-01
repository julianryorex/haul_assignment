import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:haul_assignment/components/card.dart';
import 'package:haul_assignment/components/weekly_list.dart';
import 'package:haul_assignment/models/workday.dart';
import 'package:haul_assignment/redux/actions.dart';
import 'package:haul_assignment/redux/reducer.dart';
import 'package:haul_assignment/redux/workday_state.dart';
import 'package:haul_assignment/utilities.dart';
import 'package:redux/redux.dart';

import 'components/navbar.dart';
import 'services/read_json.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Store<WorkdayState> _store;

  @override
  void initState() {
    super.initState();
    createStore();
  }

  void createStore() {
    _store = Store<WorkdayState>(
      combinedReducer,
      initialState: WorkdayState((b) => b..workdayList = BuiltList<Workday>([]).toBuilder()),
      middleware: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/daily',
        routes: {
          '/daily': (context) => Page(child: DailyPage()),
          '/weekly': (context) => Page(child: WeeklyList()),
          '/focus': (context) => FocusPage(),
        },
      ),
    );
  }
}

class FocusPage extends StatelessWidget {
  const FocusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: HaulColors.orange),
        title: Text("Workday", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      backgroundColor: HaulColors.orange,
      body: Center(child: HaulCard()),
    );
  }
}

class Page extends StatefulWidget {
  final Widget child;

  Page({Key key, this.child}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  BuiltList<Workday> workdayList = BuiltList<Workday>([]);

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  void loadJson() async {
    int i = 1;
    ReadJson readJson;
    do {
      readJson = ReadJson('assets/HOS-log-$i.json');
      await readJson.loadJson();
      final newList = readJson.getWorkdayList();
      workdayList = workdayList.rebuild((b) => b..addAll(newList));
      i++;
    } while (readJson.hasNextPage());

    // update state with list once processed
    StoreProvider.of<WorkdayState>(context).dispatch(UpdateWorkdayList(workdayList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        title: Text("Your Workday Summary", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(color: HaulColors.orange, child: widget.child),
    );
  }
}

class DailyPage extends StatelessWidget {
  const DailyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<WorkdayState, BuiltList<Workday>>(
      converter: (store) => store.state.workdayList,
      builder: (context, BuiltList<Workday> workdayList) {
        return ListView.separated(
          padding: EdgeInsets.all(20),
          separatorBuilder: (context, index) => ListItemSeparator(),
          scrollDirection: Axis.horizontal,
          itemCount: workdayList.length,
          itemBuilder: (BuildContext context, int index) => HaulCard(workday: workdayList[index]),
        );
      },
    );
  }
}

class ListItemSeparator extends StatelessWidget {
  const ListItemSeparator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 15);
  }
}
