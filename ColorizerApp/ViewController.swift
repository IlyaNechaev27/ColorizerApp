//
//  ViewController.swift
//  ColorizerApp
//
//  Created by Илья Нечаев on 05.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setBackgroundColor(with color: UIColor)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.color = view.backgroundColor
        settingVC.delegate = self
    }

}
extension ViewController: SettingsViewControllerDelegate {
    func setBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }
}

