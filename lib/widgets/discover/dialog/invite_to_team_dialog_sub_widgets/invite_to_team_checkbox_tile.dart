import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/serializers/discover/user_bs_teams_serializer.dart';
import 'package:unify/model/discover/invite_to_team_model.dart';
import 'package:unify/utils/formatter/text_formatter.dart';

class InviteToTeamCheckboxTile extends StatelessWidget {
  const InviteToTeamCheckboxTile({super.key, required this.team});
  final UserBsTeamsListing team;

  @override
  Widget build(BuildContext context) {
    return Consumer<InviteToTeamModel>(
        builder: (context, formValues, child) => CheckboxListTile(
              value: formValues.getValueByKey(team.id),
              onChanged: (bool? val) {
                formValues.setValueByKey(team.id, val ?? false);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              title: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: team.imgUrl == ""
                          ? const Image(
                              image: AssetImage('assets/images/logos/BS.png'))
                          : Image.network(team.imgUrl),
                    ),
                  ),
                  Text(shrinkText(team.name))
                ],
              ),
            ));
  }
}
