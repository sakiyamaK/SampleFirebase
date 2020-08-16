//
//  MLViewController.swift
//  SampleFirebase
//
//  Created by sakiyamaK on 2020/05/04.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import Firebase

class MLViewController: UIViewController {

    @IBOutlet weak var transButton: UIButton!
    @IBOutlet weak var preTextView: UITextView!
    @IBOutlet weak var afterTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        transButton.addTarget(self, action: #selector(tapTransButton(_ :)), for: .touchUpInside)
    }

    @objc func tapTransButton(_ sender: UIButton) {
        debugPrint(TranslateLanguage.en)
        let languageId = NaturalLanguage.naturalLanguage().languageIdentification()
        languageId.identifyLanguage(for: self.preTextView.text) { (codeStr, error) in
            if let _error = error {
                debugPrint(_error)
                return
            }

            guard
                let _codeStr = codeStr else {
                    debugPrint("no languageCode")
                    return
            }

            let sourceLanguageCode = TranslateLanguage.fromLanguageCode(_codeStr)
            debugPrint("==================")
            debugPrint(sourceLanguageCode.rawValue)
            debugPrint(TranslateLanguage.zh.rawValue)

            let options = TranslatorOptions(sourceLanguage: sourceLanguageCode, targetLanguage: .en)
            let translator = NaturalLanguage.naturalLanguage().translator(options: options)
            translator.downloadModelIfNeeded { (error) in
                if let _error = error {
                    debugPrint(_error)
                    return
                }
                translator.translate(self.preTextView.text) { (afterText, error) in
                    if let _error = error {
                        debugPrint(_error)
                        return
                    }
                    guard let afterText = afterText else { return }
                    DispatchQueue.main.async {
                        self.afterTextView.text = afterText
                    }
                }
            }
        }
    }
}
