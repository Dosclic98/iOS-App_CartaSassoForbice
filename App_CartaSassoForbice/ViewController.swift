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
        gameState.text = "Carta, Sasso, Forbice?"
        self.view.backgroundColor = UIColor.gray
        enebShowPlayBtn()
    }
    
    func calcState(_ playerVal: Int,_ compVal: Int) {
        if(compVal == ((playerVal + 1) % 3)) {
            // vinto
            genState(playerVal, compVal, "Hai Vinto!", UIColor.green)
        } else if(compVal == ((playerVal + 2) % 3)) {
            // perso
            genState(playerVal, compVal, "Hai Perso!", UIColor.red)
        } else {
            // pareggio
            genState(playerVal, compVal, "Pareggio!", UIColor.gray)
        }
    }
    
    func genState(_ playerVal: Int,_ compVal: Int,_ stateDescr: String,_ bgColor: UIColor) {
        self.view.backgroundColor = bgColor
        compChoice.text = calcEmoji(compVal)
        gameState.text = stateDescr
        disableHide(playerVal)
        enablePlayAgain()
    }
    
    func calcEmoji(_ val: Int) -> String {
        if(val == 0) {
            return paperEmoji;
        } else if(val == 1) {
            return rockEmoji
        } else {
            return scissorEmoji
        }
    }
    
    func enebShowPlayBtn() {
        paperBtn.isEnabled = true;
        paperBtn.isHidden = false;

        rockBtn.isEnabled = true;
        rockBtn.isHidden = false;

        scissorBtn.isEnabled = true;
        scissorBtn.isHidden = false;

    }
    
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
    
    func enablePlayAgain() {
        playAgainBtn.isHidden = false
        playAgainBtn.isEnabled = true
    }
    
    func randomChoice() -> Int {
        return randomDist.nextInt()
    }
    
}

