//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Adrian Camacho Soriano on 16/04/16.
//  Copyright © 2016 Adrian Camacho Soriano acaso. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var indexSong: Int!
    var shuffle: Int!
    
    private var reproductor: AVAudioPlayer!
    let titulos: [String] = ["Abracadabra","Czardas","I Dont Want Spoil The Party","My Sweet Lord","Somethig Stupid"]
    let canciones: [String] = ["Abracadabra","Czardas","I Don't Want To Spoil The Party","My Sweet Lord","Something stupid"]
    let portadas: [String] = ["Abracadabra","Czardas.Portada","BeatlesForSale_1","My_Sweet_Lord","Frank&Nancy"]
    
    @IBOutlet weak var titulo: UILabel!

    @IBOutlet weak var cover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if indexSong == 5 {
            let shuffle = Int(arc4random_uniform(UInt32(canciones.count)))
            //print("shuffle:\(shuffle)")
            indexSong = shuffle
        }
        addResource(indexSong!)
    }
    func addResource(songNumber: Int!) {
        let songSource = NSBundle.mainBundle().URLForResource(canciones[indexSong], withExtension: "mp3")
        let coverSource = NSBundle.mainBundle().URLForResource(portadas[indexSong], withExtension: "jpg")
        let coverData = NSData(contentsOfURL: coverSource!)
        let titleSource = titulos[indexSong]
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: songSource!)
        }catch{
            print("Error al cargar el archivo")
        }
        titulo.text = titleSource
        cover.image = UIImage (data: coverData!)
    }
    
    @IBAction func play() {
        if !reproductor.playing {
            reproductor.play()
        }
    }
    
    @IBAction func pause() {
        if reproductor.playing{
            reproductor.pause()
        }
    }
    
    @IBAction func stop() {
        if  reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0
        }
    }
    
    @IBOutlet weak var volumen: UISlider!
    
    @IBAction func sliderValueChanged() {
        reproductor.volume = volumen.value
    }
    
}

