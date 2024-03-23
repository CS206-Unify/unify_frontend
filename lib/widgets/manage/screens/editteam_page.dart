import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/manage_team.dart';
import 'package:unify/data/unify-spring/serializers/manage/edit_team_serializer.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/section/team_members_section.dart';
import 'package:unify/widgets/manage/form/image_upload_form.dart';
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
  final _teamNameController = TextEditingController();
  final _regionController = TextEditingController();
  final _maxTeamSizeController = TextEditingController();
  final _trophyRequirementsController = TextEditingController();
  final _minWins3v3Controller = TextEditingController();
  final _minWins2v2Controller = TextEditingController();
  final _minSoloWinsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getTeamDetailsById(widget.teamId).then((team) => setState(() {
          _teamNameController.text = team.name;
          _regionController.text = team.region;
          _maxTeamSizeController.text = team.maxTeamSize.toString();
          _trophyRequirementsController.text = team.maxTeamSize.toString();
          _minWins3v3Controller.text = team.min3v3Wins.toString();
          _minWins2v2Controller.text = team.minDuoWins.toString();
          _minSoloWinsController.text = team.minSoloWins.toString();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: 'Edit Team',
        game: 'bs',
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(24),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 12,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: const ImageUploadForm(),
                ),
                TeamDetailsSection(
                    teamNameController: _teamNameController,
                    regionController: _regionController,
                    maxTeamSizeController: _maxTeamSizeController),
                TeamMembersSection(teamId: widget.teamId,),
                TeamRequirementsSections(
                    trophyRequirementsController: _trophyRequirementsController,
                    minWins3v3Controller: _minWins3v3Controller,
                    minWins2v2Controller: _minWins2v2Controller,
                    minSoloWinsController: _minSoloWinsController),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Center(
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Logger().d(_trophyRequirementsController.value.text);
                          editTeam(
                              widget.teamId,
                              EditTeamRequest(
                                  teamName: _teamNameController.value.text,
                                  region: _regionController.value.text,
                                  maximumTeamSize: int.parse(
                                      _maxTeamSizeController.value.text),
                                  imageString: null,
                                  trophyRequirements: int.parse(
                                      _trophyRequirementsController.value.text),
                                  min3v3Wins: int.parse(
                                      _minWins3v3Controller.value.text),
                                  minDuoWins: int.parse(
                                      _minWins2v2Controller.value.text),
                                  minSoloWins: int.parse(
                                      _minSoloWinsController.value.text)));
                        }
                      },
                      child: const Text(
                        'Update Team',
                      ),
                    ),
                  ),
                ),
              ],
            )

            // Card(
            //   color: Colors.transparent, // Set the color to transparent
            //   elevation:
            //       0, // Optionally, set the elevation to 0 to remove shadow
            //   child: ListTile(
            //     contentPadding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
            //     leading: ClipRRect(
            //       borderRadius: BorderRadius.circular(
            //           5), // Adjust the border radius as needed
            //       child: Image.asset(
            //         'assets/images/avatars/BenjaminGan.png',
            //         width: 40, // Set the desired width
            //         height: 40, // Set the desired height
            //       ),
            //     ),
            //     title: Text(
            //         style: Theme.of(context).textTheme.titleMedium?.apply(
            //             color: Theme.of(context)
            //                 .colorScheme
            //                 .onTertiaryContainer),
            //         'Dexter'),
            //     trailing: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(
            //           '114,918',
            //           style: Theme.of(context).textTheme.titleMedium?.apply(
            //                 color: Theme.of(context)
            //                     .colorScheme
            //                     .onTertiaryContainer,
            //                 fontSizeDelta:
            //                     -3.5, // Adjust the font size as needed
            //               ),
            //         ),
            //         Image.asset(
            //           'assets/images/brawlstars/misc/Trophy.png', // Replace with your image path
            //           width: 24, // Set the desired width
            //           height: 24, // Set the desired height
            //         ),
            //         // Adjust the spacing between the image and text
            //       ],
            //     ),
            //   ),
            // ),
            //Recruitment Requirements

            ),
      ),
      bottomNavigationBar: const BottomNavBar(current: "brawl_stars_profile"),
    );
  }
}
