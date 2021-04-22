//
//  Database02+.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2021/04/05.
//  Copyright © 2021 sakiyamaK. All rights reserved.
//


import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

extension Database {

  static func readUser(completion: ((Result<[UserModel], Error>) -> Void)? = nil) {

    db.collection("public_users").getDocuments { (querySnapshot, error) in
      if let error = error {
        completion?(.failure(error))
        return
      }

      let users: [UserModel] = querySnapshot!.documents.map { try? $0.data(as: UserModel.self, decoder: Firestore.Decoder()) }.compactMap { $0 }

      completion?(.success(users))
    }
  }
}
