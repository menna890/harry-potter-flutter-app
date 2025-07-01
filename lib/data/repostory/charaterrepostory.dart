
import 'package:harry_final/data/model/harrycharacter.dart';
import 'package:harry_final/data/web_service/characterwebservice.dart';

class Charaterrepostory {
  CharacterWebService characterWebService;

  Charaterrepostory({required this.characterWebService});
  Future<List<HarryCharacters>> getCharacter() async {
    final characters = await characterWebService.getCharacter();
    return characters.map((character)=> HarryCharacters.fromJson(character)).toList();
  }
}
