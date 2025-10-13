import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../data/models/app_user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamSubscription? _userSubscription;

  void listenToUserData() {
    emit(UserLoading());
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      emit(UserError("User not logged in."));
      return;
    }

    final userDocStream = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots();

    _userSubscription?.cancel();

    _userSubscription = userDocStream.listen(
      (snapshot) {
        if (snapshot.exists) {
          final user = AppUserModel.fromFirestore(snapshot);
          emit(UserLoaded(user));
        } else {
          emit(UserError("User data not found."));
        }
      },
      onError: (error) {
        emit(UserError("Failed to load user data: ${error.toString()}"));
      },
    );
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  getCurrentUserData() async {
    try {
      emit(UserLoading());

      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentReference userDocRef = FirebaseFirestore.instance
          .collection("users")
          .doc(userId);

      DocumentSnapshot doc = await userDocRef.get();

      if (doc.exists) {
        user = AppUserModel.fromFirestore(doc);
        emit(UserLoaded(user!));
      } else {
        emit(UserError("No user data found for the current user"));
      }
    } catch (e) {
      emit(UserError("Error retrieving user data: $e"));
    }
  }

  AppUserModel? user;

  Future<void> updateProfile({
    String? fullName,
    String? phoneNumber,
    File? profilePicture,
    double? balance,
  }) async {
    emit(UserLoading());
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception("User not logged in");
      }

      String? photoUrl;
      if (profilePicture != null) {
        // String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        // Reference reference =
        //     FirebaseStorage.instance.ref().child('user_photos/$fileName');
        // UploadTask uploadTask = reference.putFile(profilePicture);
        // TaskSnapshot taskSnapshot = await uploadTask;
        // photoUrl = await taskSnapshot.ref.getDownloadURL();
      }

      final Map<String, dynamic> updatedData = {
        if (fullName != null) 'name': fullName,
        if (phoneNumber != null) 'phone': phoneNumber,
      };

      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .update(updatedData);

      user = AppUserModel(
        name: fullName ?? user?.name ?? '',
        phone: phoneNumber ?? user?.phone ?? '',
        photoUrl: photoUrl ?? user?.photoUrl ?? '',
        createdAt: user?.createdAt ?? DateTime.now(),
        balance: balance ?? user?.balance ?? 0,
      );

      emit(UserSuccess());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
