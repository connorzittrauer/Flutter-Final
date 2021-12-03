//I'm really not sure if this is r/ProgrammingHorror or not....
class Exceptions {
  late String query;

  Exceptions() {}

  String parse(String breed) {
    const EXCEPTION_LIST = [
      'mountain',
      'finnish',
      'african',
      'australian',
      'eskimo',
      'pyrenees',
    ];
    if (EXCEPTION_LIST.contains(breed)) {
      query = breed + " dog";
      return query;
    }
    switch (breed) {
      case "mexicanhairless":
        query = 'MEXICAN HAIRLESS';
        break;
      case "bluetick":
        query = "BLUETICK COONHOUND";
        break;
      case 'waterdog':
        query = 'WATER DOG';
        break;
      case 'malinois':
        query = 'BELGIAN SHEPHERD';
        break;
      case 'mix':
        query = 'mutt';
        break;
      case 'germanshepherd':
        query = 'german shepherd';
        break;
      case 'groenendael':
        query = 'belgian shepherd';
        break;
      case 'cotondetulear':
        query = 'coton de Tuléar dog breed';
        break;
      case 'collie':
        query = 'border collie';
        break;
      case 'lhasa':
        query = 'lhasa apso';
        break;
      case 'pekinese':
        query = "pekingese";
        break;
      case 'pitbull':
        query = "pitbull terrier";
        break;
      case 'pointer':
        query = 'english pointer';
        break;
      case 'shihtzu':
        query = 'shih tzu';
        break;
      case 'stbernard':
        query = 'saint bernard';
        break;
      case 'greyhound':
        query = 'english greyhound';
        break;
      case 'tervuren':
        query = 'Chien de Berger Belge';
        break;
      default:
        query = breed;
        break;
    }

    return query;
  }
}
