/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState
{
    final String? userName;
    final bool isAuthorized;

    const UserState({
        this.userName,
        required this.isAuthorized
    });

    UserState copyWith({
        String? userName,
        bool? isAuthorized
    }) 
    {
        return UserState(
            userName: userName ?? this.userName,
            isAuthorized: isAuthorized ?? this.isAuthorized
        );
    }
}

class UserNotifier extends Notifier<UserState>
{
    @override
    UserState build() 
    {
        return const UserState(isAuthorized: false);
    }

    void login(String name) 
    {
        state = state.copyWith(
            userName: name,
            isAuthorized: true
        );
    }

    void logout() 
    {
        state = const UserState(isAuthorized: false);
    }
}

final userStateProvider =
    NotifierProvider<UserNotifier, UserState>(UserNotifier.new);
