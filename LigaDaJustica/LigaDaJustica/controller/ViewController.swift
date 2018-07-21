//
//  ViewController.swift
//  LigaDaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var stpNota: UIStepper!
    @IBOutlet weak var swtPoder: UISwitch!
    @IBOutlet weak var lbNota: UILabel!
    @IBOutlet weak var tfImg: UITextField!
    @IBOutlet weak var img: UIImageView!
    
    var index: Int!
    var cadastro: Cadastro!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.cadastro = delegate.cadastro
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (self.index != nil){
            let heroi = self.cadastro.get(index: self.index)
            let imgUrl = heroi.imgUrl
            self.tfNome.text = heroi.nome
            self.lbNota.text = String(heroi.nota)
            self.stpNota.value = Double(heroi.nota)
            if (heroi.poder){
                self.swtPoder.setOn(true, animated: true)
            }else{
                self.swtPoder.setOn(false, animated: true)
            }
            self.tfImg.text = imgUrl
            if !(imgUrl!.isEmpty){
                getImage(imgUrl: imgUrl!)
            }

        }
        
        self.tfNome.becomeFirstResponder()
    }
    
    
    @IBAction func loadImage(_ sender: Any) {
        let imgUrl = self.tfImg.text!
        if !(imgUrl.isEmpty){
            getImage(imgUrl: imgUrl)
        }
    }
    @IBAction func definirNota(_ sender: Any) {
        self.lbNota.text = String(Int(self.stpNota.value))
    }
    
    @IBAction func save(_ sender: Any) {
        let nome = self.tfNome.text!
        let imgUrl = self.tfImg.text!
        let nota = Int(self.stpNota.value)
        let poder = self.swtPoder.isOn
        let heroi = Heroi(nome: nome, imgUrl: imgUrl, nota: nota, poder: poder)
        
        if (self.index != nil){
            self.cadastro.update(index: self.index, heroi: heroi)
        }else{
            self.cadastro.add(heroi: heroi)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func getImage(imgUrl: String){
        let session = URLSession(configuration: .default)
        let URL_IMAGE = URL(string:imgUrl)
        let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                        let image = UIImage(data: imageData)
                        
                        //displaying the image
                        self.img.image = image
                        
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
    }
}

