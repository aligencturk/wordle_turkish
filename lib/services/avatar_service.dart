import 'dart:math';

class AvatarService {
  static final List<String> _safeEmojis = [
    // Hayvanlar
    '🐶', '🐱', '🐭', '🐹', '🐰', '🦊', '🐻', '🐼', '🐨', '🐯', '🦁', '🐮', '🐷', '🐸', '🐵',
    '🐧', '🐦', '🐤', '🐣', '🐥', '🦆', '🦅', '🦉', '🦇', '🐺', '🐗', '🐴', '🦄', '🐝', '🐛',
    '🦋', '🐌', '🐞', '🐜', '🦗', '🕷', '🦂', '🐢', '🐍', '🦎', '🦖', '🦕', '🐙', '🦑', '🦐',
    '🦞', '🦀', '🐡', '🐠', '🐟', '🐬', '🐳', '🐋', '🦈', '🐊', '🐅', '🐆', '🦓', '🦍', '🦧',
    
    // Yiyecek ve İçecek
    '🍎', '🍊', '🍋', '🍌', '🍉', '🍇', '🍓', '🍈', '🍒', '🍑', '🥭', '🍍', '🥥', '🥝', '🍅',
    '🍆', '🥑', '🥦', '🥬', '🥒', '🌶', '🌽', '🥕', '🧄', '🧅', '🥔', '🍠', '🥐', '🥖', '🍞',
    '🥨', '🧀', '🥚', '🍳', '🧈', '🥞', '🧇', '🥓', '🥩', '🍗', '🍖', '🌭', '🍔', '🍟', '🍕',
    '🥪', '🥙', '🧆', '🌮', '🌯', '🥗', '🥘', '🍝', '🍜', '🍲', '🍛', '🍣', '🍱', '🥟', '🦪',
    '🍤', '🍙', '🍚', '🍘', '🍥', '🥠', '🥮', '🍢', '🍡', '🍧', '🍨', '🍦', '🥧', '🧁', '🍰',
    '🎂', '🍮', '🍭', '🍬', '🍫', '🍿', '🍩', '🍪', '🌰', '🥜', '🍯', '🥛', '☕', '🍵', '🧃',
    
    // Aktiviteler ve Sporlar
    '⚽', '🏀', '🏈', '⚾', '🥎', '🎾', '🏐', '🏉', '🎱', '🏓', '🏸', '🏒', '🏑', '🥍', '🏏',
    '🥅', '⛳', '🪁', '🏹', '🎣', '🤿', '🥊', '🥋', '🎽', '🛹', '🛷', '⛸', '🥌', '🎿', '⛷',
    '🏂', '🪂', '🏋', '🤸', '🤺', '🤾', '🏌', '🏇', '🧘', '🏃', '🚴', '🏊', '🧗', '🤹',
    
    // Müzik ve Sanat
    '🎹', '🥁', '🎷', '🎺', '🎸', '🪕', '🎻', '🎤', '🎧', '🎼', '🎵', '🎶', '🎨', '🖌', '🖍',
    '📷', '📸', '🎭', '🎪', '🎨', '🎬', '🎯', '🎲', '🧩', '🎮', '🕹', '🎰', '🎳',
    
    // Doğa ve Hava Durumu
    '🌍', '🌎', '🌏', '🌕', '🌖', '🌗', '🌘', '🌑', '🌒', '🌓', '🌔', '⭐', '🌟', '✨', '⚡',
    '☄', '💫', '🌙', '☀', '🌤', '⛅', '🌦', '🌧', '⛈', '🌩', '🌨', '❄', '☃', '⛄', '🌬',
    '💨', '🌪', '🌈', '☔', '💧', '💦', '🌊', '🔥', '💥', '🌋', '🏔', '⛰', '🗻', '🏕', '🏖',
    '🏜', '🏝', '🌳', '🌲', '🌴', '🌱', '🌿', '☘', '🍀', '🎍', '🎋', '🍃', '🌾', '🌺', '🌻',
    '🌸', '🌼', '🌷', '🥀', '🌹', '🏵', '💐', '🌵', '🎄', '🌰', '🐚', '🪨',
    
    // Nesneler ve Teknoloji
    '⌚', '📱', '💻', '⌨', '🖥', '🖨', '🖱', '💽', '💾', '💿', '📀', '📼', '📷', '📸', '📹',
    '🎥', '📞', '☎', '📟', '📠', '📺', '📻', '🎙', '🎚', '🎛', '🧭', '⏰', '⏲', '⏱', '🕰',
    '⏳', '⌛', '📡', '🔮', '🪄', '📿', '🧿', '📋', '📌', '📍', '📎', '🖇', '📏', '📐', '✂',
    '🗃', '🗂', '🗞', '📰', '📑', '🔖', '📊', '📈', '📉', '📜', '📋', '📅', '📆', '🗓', '📇',
    '🗳', '🔐', '🔒', '🔓', '🔏', '🔐', '🗝', '🔨', '🪓', '⛏', '⚒', '🛠', '🗡', '⚔', '💣',
    '🪃', '🏹', '🛡', '🪚', '🔧', '🪛', '🔩', '⚙', '🗜', '⚖', '🦯', '🔗', '⛓', '🪝', '🧰',
    '🧲', '🪜', '🪣', '🪠', '🪟', '🪞', '🪑', '🪆', '🎁', '🎀', '🎊', '🎉', '🎈', '🎂', '🎃',
    
    // Geometrik Şekiller ve Simgeler
    '🔴', '🟠', '🟡', '🟢', '🔵', '🟣', '🟤', '⚫', '⚪', '🟥', '🟧', '🟨', '🟩', '🟦', '🟪',
    '⬛', '⬜', '◼', '◻', '◾', '◽', '▪', '▫', '🔶', '🔷', '🔸', '🔹', '🔺', '🔻', '💠', '🔘',
    '🔳', '🔲', '🏁', '🚩', '🎌', '🏴', '🏳', '🏴‍☠️', '🤍', '🤎', '💜', '💙', '💚', '💛', '🧡', '❤',
    
    // Mesleki ve Simgesel
    '👨‍💻', '👩‍💻', '👨‍🔬', '👩‍🔬', '👨‍🎨', '👩‍🎨', '👨‍🍳', '👩‍🍳', '👨‍🌾', '👩‍🌾',
    '👨‍⚕️', '👩‍⚕️', '👨‍🏫', '👩‍🏫', '👨‍🎓', '👩‍🎓', '👨‍💼', '👩‍💼', '👨‍🔧', '👩‍🔧',
    '👨‍🚀', '👩‍🚀', '👨‍🚒', '👩‍🚒', '👮‍♂️', '👮‍♀️', '🕵‍♂️', '🕵‍♀️', '👨‍⚖️', '👩‍⚖️',
    
    // Diğer Güvenli Simgeler
    '🎯', '🎲', '🧩', '🎮', '🕹', '🎰', '🎳', '🎪', '🎭', '🎨', '🎬', '🎤', '🎧', '🎼', '🎵',
    '🎶', '📚', '📖', '📝', '✏', '🖊', '🖋', '🖌', '🖍', '📐', '📏', '🧮', '🔬', '🔭', '📡',
    '💎', '⚗', '🧪', '🧫', '🧬', '🔬', '🔭', '📡', '💉', '🩹', '🩺', '💊', '💉', '🌡', '🧻',
    '🪒', '🧴', '🧽', '🪣', '🧹', '🧺', '🔌', '💡', '🕯', '🪔', '🧯', '⚗', '🔬', '💈', '⚖',
  ];

  static final Random _random = Random();

  /// Kullanıcı ID'sine göre deterministik avatar oluştur
  static String generateAvatar(String userId) {
    // UserId'nin hash'ini kullanarak deterministic random
    int seed = userId.hashCode;
    Random deterministicRandom = Random(seed);
    
    int index = deterministicRandom.nextInt(_safeEmojis.length);
    return _safeEmojis[index];
  }

  /// Tamamen rastgele avatar oluştur
  static String getRandomAvatar() {
    return _safeEmojis[_random.nextInt(_safeEmojis.length)];
  }

  /// Mevcut avatarı değiştir (yeni rastgele avatar)
  static String changeAvatar([String? currentAvatar]) {
    String newAvatar;
    do {
      newAvatar = getRandomAvatar();
    } while (newAvatar == currentAvatar && _safeEmojis.length > 1);
    
    return newAvatar;
  }

  /// Tüm mevcut avatarları al
  static List<String> getAllAvatars() {
    return List.from(_safeEmojis);
  }

  /// Avatar'ın geçerli olup olmadığını kontrol et
  static bool isValidAvatar(String avatar) {
    return _safeEmojis.contains(avatar);
  }

  /// Kategori bazında avatar al
  static List<String> getAvatarsByCategory(AvatarCategory category) {
    switch (category) {
      case AvatarCategory.animals:
        return _safeEmojis.sublist(0, 54);
      case AvatarCategory.food:
        return _safeEmojis.sublist(54, 135);
      case AvatarCategory.sports:
        return _safeEmojis.sublist(135, 170);
      case AvatarCategory.music:
        return _safeEmojis.sublist(170, 195);
      case AvatarCategory.nature:
        return _safeEmojis.sublist(195, 270);
      case AvatarCategory.objects:
        return _safeEmojis.sublist(270, 350);
      case AvatarCategory.shapes:
        return _safeEmojis.sublist(350, 380);
      case AvatarCategory.professions:
        return _safeEmojis.sublist(380, 400);
      case AvatarCategory.symbols:
        return _safeEmojis.sublist(400, _safeEmojis.length);
      default:
        return _safeEmojis;
    }
  }
}

enum AvatarCategory {
  animals,
  food,
  sports,
  music,
  nature,
  objects,
  shapes,
  professions,
  symbols,
  all,
} 