//
//  Database01+.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2021/04/03.
//  Copyright © 2021 sakiyamaK. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

extension Database {

  static func addTest() {
    var ref: DocumentReference? = nil
    ref = db.collection("dummys").addDocument(data: [
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

  static func readTest(completion: (([TestModel]) -> Void)? = nil) {

    let _completion: ((QuerySnapshot?, Error?) -> Void) = { (querySnapshot, err) in

      var users: [TestModel] = []

      if let err = err {
        print("Error getting documents: \(err)")
        completion?(users)
        return
      }

      for document in querySnapshot!.documents {
        if let _user = try? Firestore.Decoder().decode(TestModel.self, from: document.data()) {
          users.append(_user)
        }
      }

      completion?(users)
    }

    db.collection("dummys").getDocuments(completion: _completion) //全部終わるまで待つ
  }
}
