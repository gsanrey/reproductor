//
//  ViewController.swift
//  Reproductor
//
//  Created by Gabriel Urso Santana Reyes on 26/12/15.
//  Copyright © 2015 Gabriel Urso Santana Reyes. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var canciones = Array<Cancion>()
    private var reproductor : AVAudioPlayer!
    // reproductor
    
    @IBOutlet weak var portadaAudio: UIImageView!
    
    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c4: UIButton!
    @IBOutlet weak var c5: UIButton!
    
    @IBAction func cambiarVolumen(sender: UISlider) {
        reproductor.volume = sender.value
    }

    @IBAction func aleatorio(sender: UIButton) {
        var ncancion = random()%5
        print(ncancion)
        do{
            reproductor.stop()
             portadaAudio.image = UIImage(named: canciones[ncancion].portada)
                reproductor = try AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource(canciones[ncancion].fichero, withExtension: "mp3")!)
                reproductor.play()
                nombreCancion.text = canciones[ncancion].titulo
        }
        catch{
            print("error")
        }
    }
    @IBAction func deten(sender: AnyObject) {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    @IBAction func pausa(sender: AnyObject) {
        if reproductor.playing{
            reproductor.pause()
        }else{
            reproductor.play()
        }
    }
    @IBAction func tocar(sender: AnyObject) {
        if !reproductor.playing{
            reproductor.play()
        }
    }
    @IBAction func cancion(sender: AnyObject) {
        // cargar cancion en el reproductor
        let bot = sender as! UIButton
        let tcancion = bot.titleLabel
        textInputContextIdentifier
        do{

        switch bot.titleLabel!.text! {
            case canciones[0].titulo!:
            reproductor.stop()
            portadaAudio.image = UIImage(named: canciones[0].portada)
            reproductor = try AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource(canciones[0].fichero, withExtension: "mp3")!)
            reproductor.play()
            nombreCancion.text = canciones[0].titulo
            case canciones[1].titulo!:
            reproductor.stop()
            portadaAudio.image = UIImage(named: canciones[1].portada)
            reproductor = try AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource(canciones[1].fichero, withExtension: "mp3")!)
            reproductor.play()
            nombreCancion.text = canciones[1].titulo
            case canciones[2].titulo!:
            reproductor.stop()
            portadaAudio.image = UIImage(named: canciones[2].portada)
            reproductor = try AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource(canciones[2].fichero, withExtension: "mp3")!)
            reproductor.play()
            nombreCancion.text = canciones[2].titulo
            case canciones[3].titulo!:
            reproductor.stop()
            portadaAudio.image = UIImage(named:canciones[3].portada)
            reproductor = try AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource(canciones[3].fichero, withExtension: "mp3")!)
            reproductor.play()
            nombreCancion.text = canciones[3].titulo
            case canciones[4].titulo!:
            reproductor.stop()
            portadaAudio.image = UIImage(named: canciones[4].portada)
            reproductor = try AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource(canciones[4].fichero, withExtension: "mp3")!)
            reproductor.play()
            nombreCancion.text = canciones[4].titulo
        default:
            break

            }
        }
        catch{
            print("error")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // canciones
        canciones.append(Cancion(titulo: "corte1", fichero: "1", portada: "1.jpg"))
        canciones.append(Cancion(titulo: "corte2", fichero: "2", portada: "2.jpg"))
        canciones.append(Cancion(titulo: "corte3", fichero: "3", portada: "3.jpeg"))
        canciones.append(Cancion(titulo: "corte4", fichero: "4", portada: "4.jpg"))
        canciones.append(Cancion(titulo: "corte5", fichero: "5", portada: "5.jpg"))

        c1.setTitle(canciones[0].titulo, forState: .Normal )
        c2.setTitle(canciones[1].titulo, forState: .Normal )
        c3.setTitle(canciones[2].titulo, forState: .Normal )
        c4.setTitle(canciones[3].titulo, forState: .Normal )
        c5.setTitle(canciones[4].titulo, forState: .Normal )
        
        // cargar reproductor
        let ca = NSBundle.mainBundle().URLForResource(canciones[0].fichero, withExtension: "mp3")
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: ca!)
        }catch{
            print("error")
        }
        reproductor.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

