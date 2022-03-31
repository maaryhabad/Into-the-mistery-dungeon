//
//  ViewController.swift
//  Into the mistery dungeon
//
//  Created by Mariana Beilune Abad on 08/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    var monster = false
    var trap = false
    
    let mensagem = "Tocou no botão para "
    var direcao = ""
    
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var actions: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomEvent()
    }
    
    @IBAction func touchedUpButton(_ sender: Any) {
        direcao = "cima"
        walk(to: direcao)
    }
    
    @IBAction func touchedRightButton(_ sender: Any) {
        direcao = "direita"
        walk(to: direcao)
    }
    
    @IBAction func touchedDownButton(_ sender: Any) {
        direcao = "baixo"
        walk(to: direcao)
    }
    
    @IBAction func touchedLeftButton(_ sender: Any) {
        direcao = "esquerda"
        walk(to: direcao)
    }
    
    @IBAction func attack(_ sender: Any) {
        actions.text = "IÁÁÁÁÁÁÁÁ"
        monster = false
        print("Você atacou o monstro")
        changeEvent(imageNamed: "road", actionText: "Ufa, podemos andar novamente.")

    }
    
    @IBAction func disableTrap(_ sender: Any) {
        actions.text = "Essa eu consigo desarmar"
        trap = false
        print("Você desarmou a armadilha")
        changeEvent(imageNamed: "road", actionText: "Ufa, podemos andar novamente.")
    }
    
    func walk(to direction: String) {
        if monster == true {
            actions.text = "Preciso matar o monstro antes!"
        } else if trap == true {
            actions.text = "Não consigo andar com a armadilha na minha frente."
        } else {
            print(mensagem + direcao)
            actions.text = mensagem + direcao
            randomEvent()
        }
    }
    
    func randomEvent() {
        let numberEvent = Int.random(in: 0...2)
        
        if numberEvent == 0 {
            monster = true
            changeEvent(imageNamed: "cthulhu", actionText: "Oh não, tem um monstro na minha frente")
        } else if numberEvent == 1 {
            trap = true
            changeEvent(imageNamed: "trap", actionText: "Opa! Parece que eu vi uma armadilha.")
        } else {
            changeEvent(imageNamed: "road", actionText: "Ufa, podemos andar novamente.")
        }
    }
    
    func changeEvent(imageNamed: String, actionText: String) {
        eventImage.image = UIImage(named: imageNamed)
        actions.text = actionText
    }

}

