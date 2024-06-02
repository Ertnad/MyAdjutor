import 'package:myadjutor/core/app_export.dart';

class ProfilePage extends StatefulWidget {


  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: CustomSideMenu(figmaTextStyles: FigmaTextStyles()),
      body: ProfilePageContent(),
      bottomNavigationBar: CustomBottomBar(currentPage: 'main'),
    );
  }
}
