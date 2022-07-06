import 'package:flutter/material.dart';

enum TrustLevel {
  visitor, // Visitor
  basic, // NewUser
  known, // User
  trusted, // Known User
  veteran // Trusted User
}

const visitor = "Visitor";
const basic = "New User";
const known = "User";
const trusted = "Known User";
const veteran = "Trusted User";

const basicTag = "system_trust_basic";
const knownTag = "system_trust_known";
const trustedTag = "system_trust_trusted";
const veteranTag = "system_trust_veteran";

// 高いランクの順からタグが含まれているか比較すること
TrustLevel getTrustLevel(List<String> tags) {
  if (tags.contains(veteranTag)) {
    return TrustLevel.veteran;
  }
  if (tags.contains(trustedTag)) {
    return TrustLevel.trusted;
  }
  if (tags.contains(knownTag)) {
    return TrustLevel.known;
  }
  if (tags.contains(basicTag)) {
    return TrustLevel.basic;
  }
  return TrustLevel.visitor;
}

String toName(TrustLevel level) {
  switch (level) {
    case TrustLevel.visitor:
      return visitor;
    case TrustLevel.basic:
      return basic;
    case TrustLevel.known:
      return known;
    case TrustLevel.trusted:
      return trusted;
    case TrustLevel.veteran:
      return veteran;
  }
}

Color getTrustedLevelColor(TrustLevel level) {
  switch (level) {
    case TrustLevel.visitor:
      return Colors.white;
    case TrustLevel.basic:
      return Colors.blue;
    case TrustLevel.known:
      return Colors.lightGreenAccent;
    case TrustLevel.trusted:
      return Colors.orange;
    case TrustLevel.veteran:
      return Colors.deepPurple;
  }
}