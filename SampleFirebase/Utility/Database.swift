//
//  Firestore.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/06/13.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class Database {
  private static let db = Firestore.firestore()

  static func addTest() {

    var ref: DocumentReference? = nil
    ref = db.collection("users").addDocument(data: [
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    ]) { err in
      if let err = err {
        print("Error adding document: \(err)")
      } else {
        print("Document added with ID: \(ref!.documentID)")
      }
    }
  }

  static func readTest(completion: (([UserModel]) -> Void)? = nil) {

    let _completion: ((QuerySnapshot?, Error?) -> Void) = { (querySnapshot, err) in

      var users: [UserModel] = []

      if let err = err {
        print("Error getting documents: \(err)")
        completion?(users)
        return
      }

      for document in querySnapshot!.documents {
        if let _user = try? Firestore.Decoder().decode(UserModel.self, from: document.data()) {
          users.append(_user)
        }
      }

      completion?(users)
    }

    db.collection("users").getDocuments(completion: _completion) //全部終わるまで待つ
  }
}
