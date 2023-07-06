
// class ScreenArgument {
//   final String usernameValue;

//   ScreenArgument({required this.usernameValue});
// }
// //form Post////////////////////////////////////////////////////////////////////////////////////
//   // Form(
//                   //     child: Column(
//                   //   children: [
//                   //     TextFormField(
//                   //       controller: nameController,
//                   //       decoration: const InputDecoration(labelText: "Name"),
//                   //     ),
//                   //     TextFormField(
//                   //       controller: modelController,
//                   //       decoration: const InputDecoration(labelText: "Model"),
//                   //     ),
//                   //     TextFormField(
//                   //       controller: priceController,
//                   //       decoration: const InputDecoration(labelText: "Price"),
//                   //     ),
//                   //     ElevatedButton(
//                   //         onPressed: () {
//                   //           _postItem();
//                   //         },
//                   //         child: const Text("submit"))
//                   //   ],
//                   // )),
//                   // Container(
//                   //   child: SingleChildScrollView(
//                   //     child: Row(
//                   //       children: [
//                   //         ListView.builder(
//                   //             itemBuilder: (context, index) => Container(
//                   //                   color: Colors.blue,
//                   //                 ))
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),

//                    // ignore: avoid_unnecessary_containers

//                 // change Themes
//                 ///////////////////////////////////////////////////////////////////////////
//                      // ElevatedButton(onPressed: () {}, child: Text("ChangeTheme")),
//                   // Container(
//                   //   child: ElevatedButton(
//                   //     style: ElevatedButton.styleFrom(
//                   //       // ignore: deprecated_member_use
//                   //       primary: const Color(0xff8359E3),
//                   //       shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(35),
//                   //       ),
//                   //     ),
//                   //     onPressed: () async {
//                   //       try {
//                   //         await Auth().logOut();
//                   //       } catch (error) {
//                   //         // ignore: avoid_print
//                   //         print(error.toString());
//                   //       }
//                   //     },
//                   //     child: const Text(
//                   //       "Log out",
//                   //     ),
//                   //   ),
//                   // ),

//                   //////////////////////////get va post
//   //                 void _postItem() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   final response =
//   //       await HomeRepositoryImpl().postListShoppingItem(ShoppingItem(
//   //     model: modelController.text,
//   //     name: nameController.text,
//   //     price: int.tryParse(priceController.text) ?? 0,
//   //   ));
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   //   if (response is DataSuccess) {
//   //     Fluttertoast.showToast(
//   //       msg: "Post Item thanh cong",
//   //       toastLength: Toast.LENGTH_LONG,
//   //       gravity: ToastGravity.TOP,
//   //       timeInSecForIosWeb: 1,
//   //       backgroundColor: Colors.blue,
//   //       textColor: Colors.white,
//   //       fontSize: 16.0,
//   //     );
//   //     _getItems();
//   //   } else {
//   //     Fluttertoast.showToast(
//   //       msg: "Post Item that bai",
//   //       toastLength: Toast.LENGTH_LONG,
//   //       gravity: ToastGravity.TOP,
//   //       timeInSecForIosWeb: 1,
//   //       backgroundColor: Colors.red,
//   //       textColor: Colors.white,
//   //       fontSize: 16.0,
//   //     );
//   //   }
//   // }

//   // List<ShoppingItem> shoppingList = [];

//   // void _getItems() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   final response = await HomeRepositoryImpl().getListShoppingItem();

//   //   if (response is DataSuccess) {
//   //     setState(() {
//   //       shoppingList = response.data?.listShoppingItem ?? [];
//   //     });
//   //   }
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }