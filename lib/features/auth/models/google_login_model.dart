class GoogleLoginModel {
  User? user;
  String? providerId;
  TokenResponse? tokenResponse;
  String? operationType;

  GoogleLoginModel({
    this.user,
    this.providerId,
    this.tokenResponse,
    this.operationType,
  });

  GoogleLoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    providerId = json['providerId'];
    tokenResponse = json['tokenResponse'] != null
        ? TokenResponse.fromJson(json['tokenResponse'])
        : null;
    operationType = json['operationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['providerId'] = providerId;
    if (tokenResponse != null) {
      data['tokenResponse'] = tokenResponse!.toJson();
    }
    data['operationType'] = operationType;
    return data;
  }
}

class User {
  String? uid;
  String? email;
  bool? emailVerified;
  String? displayName;
  bool? isAnonymous;
  String? photoURL;
  List<ProviderData>? providerData;
  StsTokenManager? stsTokenManager;
  String? createdAt;
  String? lastLoginAt;
  String? apiKey;
  String? appName;

  User({
    this.uid,
    this.email,
    this.emailVerified,
    this.displayName,
    this.isAnonymous,
    this.photoURL,
    this.providerData,
    this.stsTokenManager,
    this.createdAt,
    this.lastLoginAt,
    this.apiKey,
    this.appName,
  });

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    displayName = json['displayName'];
    isAnonymous = json['isAnonymous'];
    photoURL = json['photoURL'];

    if (json['providerData'] != null) {
      providerData = <ProviderData>[];
      json['providerData'].forEach((v) {
        providerData!.add(ProviderData.fromJson(v));
      });
    }

    stsTokenManager = json['stsTokenManager'] != null
        ? StsTokenManager.fromJson(json['stsTokenManager'])
        : null;
    createdAt = json['createdAt'];
    lastLoginAt = json['lastLoginAt'];
    apiKey = json['apiKey'];
    appName = json['appName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    data['displayName'] = displayName;
    data['isAnonymous'] = isAnonymous;
    data['photoURL'] = photoURL;

    if (providerData != null) {
      data['providerData'] = providerData!.map((v) => v.toJson()).toList();
    }

    if (stsTokenManager != null) {
      data['stsTokenManager'] = stsTokenManager!.toJson();
    }
    data['createdAt'] = createdAt;
    data['lastLoginAt'] = lastLoginAt;
    data['apiKey'] = apiKey;
    data['appName'] = appName;
    return data;
  }
}

class ProviderData {
  String? providerId;
  String? uid;
  String? displayName;
  String? email;
  dynamic phoneNumber;
  String? photoURL;

  ProviderData({
    this.providerId,
    this.uid,
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoURL,
  });

  ProviderData.fromJson(Map<String, dynamic> json) {
    providerId = json['providerId'];
    uid = json['uid'];
    displayName = json['displayName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    photoURL = json['photoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['providerId'] = providerId;
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['photoURL'] = photoURL;
    return data;
  }
}

class StsTokenManager {
  String? refreshToken;
  String? accessToken;
  int? expirationTime;

  StsTokenManager({this.refreshToken, this.accessToken, this.expirationTime});

  StsTokenManager.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
    accessToken = json['accessToken'];
    expirationTime = json['expirationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refreshToken'] = refreshToken;
    data['accessToken'] = accessToken;
    data['expirationTime'] = expirationTime;
    return data;
  }
}

class TokenResponse {
  String? federatedId;
  String? providerId;
  String? email;
  bool? emailVerified;
  String? firstName;
  String? fullName;
  String? lastName;
  String? photoUrl;
  String? localId;
  String? displayName;
  String? idToken;
  String? context;
  String? oauthAccessToken;
  int? oauthExpireIn;
  String? refreshToken;
  String? expiresIn;
  String? oauthIdToken;
  String? rawUserInfo;
  String? kind;

  TokenResponse({
    this.federatedId,
    this.providerId,
    this.email,
    this.emailVerified,
    this.firstName,
    this.fullName,
    this.lastName,
    this.photoUrl,
    this.localId,
    this.displayName,
    this.idToken,
    this.context,
    this.oauthAccessToken,
    this.oauthExpireIn,
    this.refreshToken,
    this.expiresIn,
    this.oauthIdToken,
    this.rawUserInfo,
    this.kind,
  });

  TokenResponse.fromJson(Map<String, dynamic> json) {
    federatedId = json['federatedId'];
    providerId = json['providerId'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    firstName = json['firstName'];
    fullName = json['fullName'];
    lastName = json['lastName'];
    photoUrl = json['photoUrl'];
    localId = json['localId'];
    displayName = json['displayName'];
    idToken = json['idToken'];
    context = json['context'];
    oauthAccessToken = json['oauthAccessToken'];
    oauthExpireIn = json['oauthExpireIn'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    oauthIdToken = json['oauthIdToken'];
    rawUserInfo = json['rawUserInfo'];
    kind = json['kind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['federatedId'] = federatedId;
    data['providerId'] = providerId;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    data['firstName'] = firstName;
    data['fullName'] = fullName;
    data['lastName'] = lastName;
    data['photoUrl'] = photoUrl;
    data['localId'] = localId;
    data['displayName'] = displayName;
    data['idToken'] = idToken;
    data['context'] = context;
    data['oauthAccessToken'] = oauthAccessToken;
    data['oauthExpireIn'] = oauthExpireIn;
    data['refreshToken'] = refreshToken;
    data['expiresIn'] = expiresIn;
    data['oauthIdToken'] = oauthIdToken;
    data['rawUserInfo'] = rawUserInfo;
    data['kind'] = kind;
    return data;
  }
}
