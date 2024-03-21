import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/edit_team_model.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/manage/section/team_details_section.dart';
import 'package:unify/widgets/manage/section/team_requirements_section.dart';

class EditTeamPage extends StatefulWidget {
  const EditTeamPage({
    super.key,
    required this.teamId,
  });

  final String teamId;

  @override
  State<EditTeamPage> createState() => _EditTeamPageState();
}

class _EditTeamPageState extends State<EditTeamPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: 'Edit Team',
        game: 'bs',
      ),
      body: ChangeNotifierProvider.value(
        value: EditTeamModel()..getTeamById(widget.teamId),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            children: <Widget>[
              // const ImageUploadForm(),
              const TeamDetailsSection(),
              //List of members
              //Hard code the other cards
              Card(
                color: Colors.transparent, // Set the color to transparent
                elevation:
                    0, // Optionally, set the elevation to 0 to remove shadow
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        5), // Adjust the border radius as needed
                    child: Image.asset(
                      'assets/images/avatars/BenjaminGan.png',
                      width: 40, // Set the desired width
                      height: 40, // Set the desired height
                    ),
                  ),
                  title: Text(
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                      'Dexter'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '114,918',
                        style: Theme.of(context).textTheme.titleMedium?.apply(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                              fontSizeDelta:
                                  -3.5, // Adjust the font size as needed
                            ),
                      ),
                      Image.asset(
                        'assets/images/brawlstars/misc/Trophy.png', // Replace with your image path
                        width: 24, // Set the desired width
                        height: 24, // Set the desired height
                      ),
                      // Adjust the spacing between the image and text
                    ],
                  ),
                ),
              ),
              //Recruitment Requirements
              const TeamRequirementsSections(),
              Center(
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Send data to back end
                    }
                  },
                  child: const Text(
                    'Update Team',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: "brawl_stars_profile"),
    );
  }
}
