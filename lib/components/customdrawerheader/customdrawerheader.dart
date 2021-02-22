import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login/login_screen.dart';
import 'package:flutter_app/stores/page_store.dart';
import 'package:flutter_app/stores/user_manager_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

    return GestureDetector(
      onTap: (){
        if(userManagerStore.IsLoggedIn){
          GetIt.I<PageStore>().setPage(4);
        }else {
          Navigator.of(context).pop();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginScreen())
          );
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.white, size: 35,),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(builder: (_){
                    return Text(
                        userManagerStore.userNameOrGeneric,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )
                    );
                  }),
                  Observer(builder: (_){
                    return Text(
                        userManagerStore.userEmailOrGeneric,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        )
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
