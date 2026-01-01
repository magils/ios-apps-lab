//
//  FlagController.swift
//  FlagGuess
//
//  Created by Moises Gil on 3/24/25.
//

import UIKit

class FlagController {
    
    let FLAGS = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Spain",
        "United Kingdom",
        "United States",
        "Russia",
        "Monaco",
        "Nigeria",
        "Poland"
    ]

    func generateQuestion(
        optionButtons: [UIButton?],
        excludeFlags: [String],
        correctCallback: @escaping () -> Void,
        wrongCallback: (() -> Void)? = nil
    ) -> String? {
        let flagName = FLAGS.filter({ !excludeFlags.contains($0) }).randomElement()
        
        if let flagName = flagName {
            let optionsFiller = FLAGS.filter {$0 != flagName}
            let options = (optionsFiller.shuffled()[0..<2] + [flagName]).shuffled()
                        
            for ix in 0..<options.count {
                let button = optionButtons[ix]!
                let optionValue = options[ix]
                                
                button.setTitle(optionValue, for: .normal)
                
                // Remove previous events added
                button.removeTarget(nil, action: nil, for: .allEvents)
                
                if(optionValue == flagName) {
                    button.addAction(UIAction { _ in correctCallback() }, for: .touchUpInside)
                } else {
                    button.addAction(UIAction { _ in wrongCallback?() }, for: .touchUpInside)
                }
            }
        }
        
        return flagName
    }
}
