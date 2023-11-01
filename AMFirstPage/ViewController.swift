//
//  ViewController.swift
//  AMFirstPage
//
//  Created by Lijin Benny on 26/10/23.
//

import UIKit

protocol CountrySelectionDelegate2: AnyObject {
    func didSelectCountry2(icon: String, title: String)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var testUserButton: UIButton!
    @IBOutlet weak var changeCountryButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotCredentialsButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    var countryView: CountryViewController?
    var delegate2: CountrySelectionDelegate2?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customFontStyle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let navController = segue.destination as? UINavigationController ,
           let destination = navController.topViewController as? CountryViewController {
            destination.delegate = self
        }
        if let navController2 = segue.destination as? UINavigationController ,
           let destination2 = navController2.topViewController as? languageViewController {
            destination2.delegate = self
        }
    }
    
    func customFontStyle() {
        let buttonFont = UIFont(name: "Arial Bold", size: 12.0)  // Change the font size as needed

        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: buttonFont
        ]
        let testUserAction = NSAttributedString(string: Strings.testUserButton.localized, attributes: attributes)
        testUserButton.setAttributedTitle(testUserAction, for: .normal)

        let countryAction = NSAttributedString(string: Strings.changeCountryButton.localized, attributes: attributes)
        changeCountryButton.setAttributedTitle(countryAction, for: .normal)

        let loginAction = NSAttributedString(string: Strings.loginButton.localized, attributes: attributes)
        loginButton.setAttributedTitle(loginAction, for: .normal)

        let forgotAction = NSAttributedString(string: Strings.forgotButton.localized, attributes: attributes)
        forgotCredentialsButton.setAttributedTitle(forgotAction, for: .normal)

        usernameTextField.placeholder = Strings.usernamePlaceholder.localized
        passwordTextField.placeholder = Strings.passwordPlaceholder.localized

    }
}

extension ViewController: CountrySelectionDelegate {
    
    func didSelectCountry(icon: String, title: String) {
        countryImage.image = UIImage(named: icon)
        countryName.text = title
        delegate2?.didSelectCountry2(icon: icon, title: title)
        
    }
}

extension ViewController: LanguageSelectionDelegate {
    
    func didSelectlanguage(lang: String) {
        languageLabel.text = lang
    }
}

