//
//  ViewController.swift
//  BlackjackGame
//
//  Created by John Crawley on 30/06/2020.
//

import UIKit

class ViewController: UIViewController
{
    //----Variables----//
    //Player//
    var playerScore = 0
    var wins = 0
    var loss = 0
    //Dealer//
    var dealerScore = 0
    //GAME IMAGES//
    let card: [UIImage] =
    [
        UIImage(named: "2c.png")!,                  //  INDEX: 0
        UIImage(named: "2d.png")!,                  //  INDEX: 1
        UIImage(named: "2h.png")!,                  //  INDEX: 2
        UIImage(named: "2s.png")!,                  //  INDEX: 3
        UIImage(named: "3c.png")!,                  //  INDEX: 4
        UIImage(named: "3d.png")!,                  //  INDEX: 5
        UIImage(named: "3h.png")!,                  //  INDEX: 6
        UIImage(named: "3s.png")!,                  //  INDEX: 7
        UIImage(named: "4c.png")!,                  //  INDEX: 8
        UIImage(named: "4d.png")!,                  //  INDEX: 9
        UIImage(named: "4h.png")!,                  //  INDEX: 10
        UIImage(named: "4s.png")!,                  //  INDEX: 11
        UIImage(named: "5c.png")!,                  //  INDEX: 12
        UIImage(named: "5d.png")!,                  //  INDEX: 13
        UIImage(named: "5h.png")!,                  //  INDEX: 14
        UIImage(named: "5s.png")!,                  //  INDEX: 15
        UIImage(named: "6c.png")!,                  //  INDEX: 16
        UIImage(named: "6d.png")!,                  //  INDEX: 17
        UIImage(named: "6h.png")!,                  //  INDEX: 18
        UIImage(named: "6s.png")!,                  //  INDEX: 19
        UIImage(named: "7c.png")!,                  //  INDEX: 20
        UIImage(named: "7d.png")!,                  //  INDEX: 21
        UIImage(named: "7h.png")!,                  //  INDEX: 22
        UIImage(named: "7s.png")!,                  //  INDEX: 23
        UIImage(named: "8c.png")!,                  //  INDEX: 24
        UIImage(named: "8d.png")!,                  //  INDEX: 25
        UIImage(named: "8h.png")!,                  //  INDEX: 26
        UIImage(named: "8s.png")!,                  //  INDEX: 27
        UIImage(named: "9c.png")!,                  //  INDEX: 28
        UIImage(named: "9d.png")!,                  //  INDEX: 29
        UIImage(named: "9h.png")!,                  //  INDEX: 30
        UIImage(named: "9s.png")!,                  //  INDEX: 31
        UIImage(named: "10c.png")!,                 //  INDEX: 32
        UIImage(named: "10d.png")!,                 //  INDEX: 33
        UIImage(named: "10h.png")!,                 //  INDEX: 34
        UIImage(named: "10s.png")!,                 //  INDEX: 35
        UIImage(named: "jc.png")!,                  //  INDEX: 36
        UIImage(named: "jd.png")!,                  //  INDEX: 37
        UIImage(named: "jh.png")!,                  //  INDEX: 38
        UIImage(named: "js.png")!,                  //  INDEX: 39
        UIImage(named: "kc.png")!,                  //  INDEX: 40
        UIImage(named: "kd.png")!,                  //  INDEX: 41
        UIImage(named: "kh.png")!,                  //  INDEX: 42
        UIImage(named: "ks.png")!,                  //  INDEX: 43
        UIImage(named: "qc.png")!,                  //  INDEX: 44
        UIImage(named: "qd.png")!,                  //  INDEX: 45
        UIImage(named: "qh.png")!,                  //  INDEX: 46
        UIImage(named: "qs.png")!,                  //  INDEX: 47
        UIImage(named: "blueCard.png")!,            //  INDEX: 48
        UIImage(named: "redCard.png")!              //  INDEX: 49
    ]
    
    
    
    //MISC//
    let YEAR = Calendar.current.component(.year, from: Date())  //Current year for Copyright label//
    var counter = 0;
    var dealerCounter = 0
    
    
    //Remove the Deal and Hold buttons//
    func removeDealHoldButtons()
    {
        btnDeal.isHidden = true
        btnHold.isHidden = true
    }
    
    
    
    //Enable the DEAL and HOLD button//
    func enableButtons()
    {
        btnDeal.isEnabled = true;
        btnDeal.backgroundColor = .black
        btnHold.isEnabled = true;
        btnHold.backgroundColor = .black
    }
    
    
    
    
    
    
    
    
    
    //---USER INTERFACE---//
    //Labels//
    @IBOutlet weak var lblPlayerWins: UILabel!  //Display how many times player won
    @IBOutlet weak var lblPlayerLoss: UILabel!  //Display how many times player lost
    
    
    
    @IBOutlet weak var lblCopyright: UILabel!   //Copyright label//
    @IBOutlet weak var lblPlayerScore: UILabel! //Label update for player's score//
    @IBOutlet weak var lblDealerScore: UILabel! //Label update for dealer's score//
    //Buttons//
    @IBOutlet weak var btnDeal: UIButton!       //Button to deal//
    @IBOutlet weak var btnHold: UIButton!       //Button to hold//
    @IBOutlet weak var btnPlayAgain: UIButton!  //Button to play again//
    
    //ImageView//
    //Player Card List//
    @IBOutlet weak var playerCardOne: UIImageView!      //Player Card#1//
    @IBOutlet weak var playerCardTwo: UIImageView!      //Player Card#2//
    @IBOutlet weak var playerCardThree: UIImageView!    //Player Card#3//
    @IBOutlet weak var playerCardFour: UIImageView!     //Player Card#4//
    @IBOutlet weak var playerCardFive: UIImageView!     //Player Card#5//
    
    //Dealer Card List//
    @IBOutlet weak var dealerCardOne: UIImageView!      //Dealer Card#1//
    @IBOutlet weak var dealerCardTwo: UIImageView!      //Dealer Card#2//
    @IBOutlet weak var dealerCardThree: UIImageView!    //Dealer Card#3//
    @IBOutlet weak var dealerCardFour: UIImageView!     //Dealer Card#4//
    @IBOutlet weak var dealerCardFive: UIImageView!     //Dealer Card#5//
    
    //View Did Load//
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //FACE CARDS DOWN//
        //SET PLAYER CARDS DOWN//
        playerCardOne.image = card[49]
        playerCardTwo.image = card[49]
        playerCardThree.image = card[49]
        playerCardFour.image = card[49]
        playerCardFive.image = card[49]
        //SET DEALER CARDS DOWN//
        dealerCardOne.image = card[48]
        dealerCardTwo.image = card[48]
        dealerCardThree.image = card[48]
        dealerCardFour.image = card[48]
        dealerCardFive.image = card[48]
        
        //Turn Play Again Button Invisible//
        btnPlayAgain.isHidden = true
        //Copyright label//
        lblCopyright.text = "John Crawley © \(YEAR)"
    }
    
    
    
    
    
    
    //FACE CARDS DOWN//
    func resetCardsDown()
    {
        //SET PLAYER CARDS DOWN//
        playerCardOne.image = card[49]
        playerCardTwo.image = card[49]
        playerCardThree.image = card[49]
        playerCardFour.image = card[49]
        playerCardFive.image = card[49]
        //SET DEALER CARDS DOWN//
        dealerCardOne.image = card[48]
        dealerCardTwo.image = card[48]
        dealerCardThree.image = card[48]
        dealerCardFour.image = card[48]
        dealerCardFive.image = card[48]
    }
    
    
    
    
    
    
    
    //Wait for the dealer to pick a card
    func waitForDealer()
    {
        if playerScore <= 25 && dealerScore <= 25
        {
            let seconds = Double.random(in: 0.01..<1.5)                   //Randomize seconds between 0.01 sec' and 4 seconds//
            self.btnDeal.isEnabled = false;                             //Disable button Deal//
            self.btnDeal.backgroundColor = .systemGray2                 //Grey out button Deal//
            self.btnHold.isEnabled = false;                             //Disable button Hold//
            self.btnHold.backgroundColor = .systemGray2                 //Grey out button Hold//
            //Wait function//
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds)
            {
                //After random seconds, restore these back to normal/
                self.showDealerCard()
                self.btnDeal.isEnabled = true
                self.btnDeal.backgroundColor = .black
                self.btnHold.isEnabled = true;
                self.btnHold.backgroundColor = .black
            }
        }
        else
        {
            removeDealHoldButtons()
        }
        
    }

    
    
    
    
    
    
    
    
    //-----PLAYER SCORE SYTEM------//
    @discardableResult func playerScoreSystem(indexID: Int) -> Int
    {
        if indexID >= 2 && indexID <= 5
        {
            playerScore += 2
        }
        else if indexID >= 6 && indexID <= 9
        {
            playerScore += 3
        }
        else if indexID >= 10 && indexID <= 13
        {
            playerScore += 4
        }
        else if indexID >= 14 && indexID <= 17
        {
            playerScore += 5
        }
        else if indexID >= 18 && indexID <= 21
        {
            playerScore += 6
        }
        else if indexID >= 21 && indexID <= 25
        {
            playerScore += 7
        }
        else if indexID >= 26 && indexID <= 29
        {
            playerScore += 8
        }
        else if indexID >= 30 && indexID <= 33
        {
            playerScore += 9
        }
        else if indexID >= 34 && indexID <= 37
        {
            playerScore += 10
        }
        else if indexID >= 38 && indexID <= 41
        {
            playerScore += 11
        }
        else if indexID >= 42 && indexID <= 45
        {
            playerScore += 10
        }
        else if indexID >= 46 && indexID <= 49
        {
            playerScore += 10
        }
        else if indexID >= 50 && indexID <= 58
        {
            playerScore += 10
        }
        
        return playerScore
    }
    
    
    
    //-----DEALER SCORE SYTEM------//
    @discardableResult func dealerScoreSystem(indexID: Int) -> Int
    {
        if indexID >= 2 && indexID <= 5
        {
            dealerScore += 2
        }
        else if indexID >= 6 && indexID <= 9
        {
            dealerScore += 3
        }
        else if indexID >= 10 && indexID <= 13
        {
            dealerScore += 4
        }
        else if indexID >= 14 && indexID <= 17
        {
            dealerScore += 5
        }
        else if indexID >= 18 && indexID <= 21
        {
            dealerScore += 6
        }
        else if indexID >= 21 && indexID <= 25
        {
            dealerScore += 7
        }
        else if indexID >= 26 && indexID <= 29
        {
            dealerScore += 8
        }
        else if indexID >= 30 && indexID <= 33
        {
            dealerScore += 9
        }
        else if indexID >= 34 && indexID <= 37
        {
            dealerScore += 10
        }
        else if indexID >= 38 && indexID <= 41
        {
            dealerScore += 11
        }
        else if indexID >= 42 && indexID <= 45
        {
            dealerScore += 10
        }
        else if indexID >= 46 && indexID <= 49
        {
            dealerScore += 10
        }
        else if indexID >= 50 && indexID <= 58
        {
            dealerScore += 10
        }
        
        return dealerScore
    }


        
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
        
        
       
    @IBAction func btnPlayAgainTapped(_ sender: Any)
    {
        //Hide the play again button button//
        btnPlayAgain.isHidden = true
        //Restart the game//
        restartGame()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //When Hold button is tapped//
    @IBAction func btnHoldTapped(_ sender: Any)
    {
        whoWon()            //Did anyone win? - if so: execute this//
        showDealerCard()    //Show dealer's card//
        whoWon()            //Did anyone win? - if so: execute this//
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //When Deal button is tapped//
    @IBAction func btnDealTapped(_ sender: Any)
    {
        //Check who won before//
        whoWon()
        //GENERATE random number index//
        let index = Int.random(in: 10...47)
        
            
        NSLog("STARTING COUNTER: \(counter)")
        counter += 1
        
        
        if counter <= 5
        {
            if counter == 1
            {
                playerCardOne.image = card[index]
                playerScoreSystem(indexID: index)
                whoWon()
            }
            else if counter == 2
            {
                playerCardTwo.image = card[index]
                playerScoreSystem(indexID: index)
                whoWon()
            }
            else if counter == 3
            {
                playerCardThree.image = card[index]
                playerScoreSystem(indexID: index)
                whoWon()
              
            }
            else if counter == 4
            {
                playerCardFour.image = card[index]
                playerScoreSystem(indexID: index)
                whoWon()
            }
            else if counter == 5
            {
                playerCardFive.image = card[index]
                playerScoreSystem(indexID: index)
                whoWon()
                //Turn off sender once 5 taps have been met//
                btnDeal.isEnabled = false
                
            }
            
            updatePlayerScore()
            waitForDealer()
           
        }
        
        //Check who won after
        whoWon()
        
     
    }


     
    
    
    
    
    
    
    
    
    
    
    
    //Function to update the Player's Score//
    func updatePlayerScore()
    {
        lblPlayerScore.text = "\(playerScore)"
        NSLog("Player Score: \(playerScore)")
    }
    //Function to update the Dealer's Score//
    func updateDealerScore()
    {
        lblDealerScore.text = "\(dealerScore)"
        NSLog("Dealer Score: \(dealerScore)")
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Show Dealers Card//
    func showDealerCard()
    {
        //Check who won before//
        whoWon()
        if playerScore <= 25 && dealerScore <= 25
        {
            //GENERATE random number index//
            let index = Int.random(in: 10...47)
            
            //Counter goes up to show each card//
            dealerCounter += 1
            
                //Show card by card//
                if dealerCounter == 1
                {
                    dealerCardOne.image = card[index]
                    dealerScoreSystem(indexID: index)
                    //IF dealer score is more than 25//
                    if dealerScore > 25
                    {
                        removeDealHoldButtons()
                    }
                }
                else if dealerCounter == 2
                {
                    dealerCardTwo.image = card[index]
                    dealerScoreSystem(indexID: index)
                    //IF dealer score is more than 25//
                    if dealerScore > 25
                    {
                        removeDealHoldButtons()
                    }
                }
                else if dealerCounter == 3
                {
                    dealerCardThree.image = card[index]
                    dealerScoreSystem(indexID: index)
                    //IF dealer score is more than 25//
                    if dealerScore > 25
                    {
                        removeDealHoldButtons()
                    }
                }
                else if dealerCounter == 4
                {
                    dealerCardFour.image = card[index]
                    dealerScoreSystem(indexID: index)
                    //IF dealer score is more than 25//
                    if dealerScore > 25
                    {
                        removeDealHoldButtons()
                    }
                }
                else if dealerCounter == 5
                {
                    dealerCardFive.image = card[index]
                    dealerScoreSystem(indexID: index)
                    //IF dealer score is more than 25//
                    if dealerScore > 25
                    {
                        removeDealHoldButtons()
                    }
                }
                
                updateDealerScore()
            //Check who won after//
            whoWon()
        }
        else
        {
            //Check who won after//
            whoWon()

        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    //Function to check who won the game//
    func whoWon()
    {
        //Player got score of 25: PLAYER WON//
        if playerScore == 25 && dealerScore < 25
        {
            //Player won
            wins += 1
            lblPlayerWins.text = "\(wins)"
            NSLog("Player Won")
            //Make play Again button NOT hidden//
            btnPlayAgain.isHidden = false
    
            
            //Show UIAlert//
            let alert = UIAlertController(title: "You won!", message: "You won!. You got 25 before the dealer could!. \nYour score is \(playerScore).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            //Remove Deal and Hold buttons//
            removeDealHoldButtons()
            
            
        }
        //Dealer got score of 25: DEALER WON//
        else if dealerScore == 25 && playerScore < 25
        {
            //dealer won
            loss += 1
            lblPlayerLoss.text = "\(loss)"
            NSLog("Dealer Won")
            //Make play Again button NOT hidden//
            btnPlayAgain.isHidden = false
            
   
            
            //Show UIAlert//
            let alert = UIAlertController(title: "You lost!", message: "You lost!. You didn't get 25 before the dealer could!. \nYour score is \(playerScore).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
            //Remove Deal and Hold buttons//
            removeDealHoldButtons()

            
            
            
            
        }
        //Player got more than equal to 25: PLAYER LOST//
        else if playerScore >= 25
        {
            //player lost
            loss += 1
            lblPlayerLoss.text = "\(loss)"
            NSLog("Player Lost - Went over 25")
            //Make play Again button NOT hidden//
            btnPlayAgain.isHidden = false
            //Show UIAlert//
            let alert = UIAlertController(title: "You Lost!", message: "You went over 25!. \nYour score is \(playerScore).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            //Remove Deal and Hold buttons//
            removeDealHoldButtons()
        }
        //Dealer got more than equal to 25: DEALER LOST//
        else if dealerScore >= 25
        {
            //dealer lost
            wins += 1
            lblPlayerWins.text = "\(wins)"
            NSLog("Dealer Lost - Went over 25")
            //Make play Again button NOT hidden//
            btnPlayAgain.isHidden = false
            //Show UIAlert//
            let alert = UIAlertController(title: "You Won!", message: "The dealer got over 25!. \nYour score is \(playerScore).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)

            //Remove Deal and Hold buttons//
            removeDealHoldButtons()
        }
        else if playerScore == 25 && dealerScore == 25
        {
            //Draw//
            NSLog("Draw!!")
            btnPlayAgain.isHidden = false
            //Show UIAlert//
            let alert = UIAlertController(title: "Draw!!", message: "You and the dealer came to a draw. \nYour score is \(playerScore).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
            //Remove Deal and Hold buttons//
            removeDealHoldButtons()
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Function to restart the game//
    func restartGame()
    {
        counter = 0
        dealerCounter = 0
        playerScore = 0
        dealerScore = 0
        lblPlayerScore.text = "\(playerScore)"
        lblDealerScore.text = "\(dealerScore)"
        enableButtons()
        resetCardsDown()
        btnDeal.isHidden = false
        btnHold.isHidden = false
    }
    

 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
}



