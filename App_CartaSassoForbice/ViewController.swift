//
//  ViewController.swift
//  App_CartaSassoForbice
//
//  Created by Davide Savarro on 18/02/2020.
//  Copyright © 2020 Davide Savarro. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    let baseStateStr = "Carta, Sasso, Forbice?"
    let winStateStr = "Hai Vinto!"
    let loseStateStr = "Hai Perso!"
    let drawStateStr = "Pareggio!"
    
    let paperEmoji = "✋"
    let rockEmoji = "👊"
    let scissorEmoji = "✌️"
    
    let randomDist = GKRandomDistribution(lowestValue: 0,highestValue: 2)
    
    @IBOutlet weak var compChoice: UILabel!
    @IBOutlet weak var gameState: UILabel!
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var scissorBtn: UIButton!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainBtn.isHidden = true;
    }

    @IBAction func paperChoice(_ sender: Any) {
        calcState(0, randomChoice())
    }
    
    @IBAction func rockChoice(_ sender: Any) {
        calcState(1, randomChoice())
    }
    
    @IBAction func scissorChoice(_ sender: Any) {
        calcState(2, randomChoice())
    }
    
    @IBAction func playAgainChoice(_ sender: Any) {
        compChoice.text = "🤖"
        playAgainBtn.isHidden = true
        gameState.text = baseStateStr
        self.view.backgroundColor = UIColor.gray
        enebShowPlayBtn()
    }
    
    // Calcola lo stato di arrivo date le due scelte (player e computer)
    func calcState(_ playerVal: Int,_ compVal: Int) {
        if(compVal == ((playerVal + 1) % 3)) {
            // vinto
            genState(playerVal, compVal, winStateStr, UIColor.green)
        } else if(compVal == ((playerVal + 2) % 3)) {
            // perso
            genState(playerVal, compVal, loseStateStr, UIColor.red)
        } else {
            // pareggio
            genState(playerVal, compVal, drawStateStr, UIColor.gray)
        }
    }
    
    // Genera lo stato calcolato
    func genState(_ playerVal: Int,_ compVal: Int,_ stateDescr: String,_ bgColor: UIColor) {
        self.view.backgroundColor = bgColor
        compChoice.text = calcEmoji(compVal)
        gameState.text = stateDescr
        disableHide(playerVal)
        enablePlayAgain()
    }
    
    // Calcola l'emoji data la scelta
    func calcEmoji(_ val: Int) -> String {
        if(val == 0) {
            return paperEmoji;
        } else if(val == 1) {
            return rockEmoji
        } else {
            return scissorEmoji
        }
    }
    
    // Abilita e mostra i bottoni di scelta del player
    func enebShowPlayBtn() {
        paperBtn.isEnabled = true;
        paperBtn.isHidden = false;

        rockBtn.isEnabled = true;
        rockBtn.isHidden = false;

        scissorBtn.isEnabled = true;
        scissorBtn.isHidden = false;

    }
    
    // Disabilita i bottoni di scelta del player e nasconde solo quelli
    // che non corrispondono al parametro in input
    func disableHide(_ toNotHide: Int) {
        paperBtn.isEnabled = false
        rockBtn.isEnabled = false
        scissorBtn.isEnabled = false
    
        if(toNotHide == 0) {
            rockBtn.isHidden = true;
            scissorBtn.isHidden = true;
        } else if(toNotHide == 1) {
            paperBtn.isHidden = true;
            scissorBtn.isHidden = true;
        } else {
            paperBtn.isHidden = true;
            rockBtn.isHidden = true;
        }
    }
    
    // Abilita e mostra il bottone "Gioca ancora"
    func enablePlayAgain() {
        playAgainBtn.isHidden = false
        playAgainBtn.isEnabled = true
    }
    
    // Esegue la scelta del computer
    func randomChoice() -> Int {
        return randomDist.nextInt()
    }
    
}

