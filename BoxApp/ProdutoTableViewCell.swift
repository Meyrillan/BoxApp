//
//  ProdutoTableViewCell.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 17/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import UIKit

class ProdutoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomeDeProduto: UILabel!
    @IBOutlet weak var avisoCapacidade: UILabel!
    
    @IBOutlet weak var botaoP: UIButton!
    @IBOutlet weak var botaoM: UIButton!
    @IBOutlet weak var botaoG: UIButton!
    @IBOutlet weak var botaoProduzir: UIButton!
    
    let dadosDefaults = DadosSetados.shared
    
    var produto:Produto = Produto.produtovazio
    
    var capacidadeTecido3:Double=0
    var capacidadeLinha3:Double=0
    var capacidadeBotao3:Double=0
   
    var quantEstoqueTecido = 0
    var quantEstoqueLinha = 0
    var quantEstoqueBotao = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        botaoProduzir.layer.cornerRadius = 3
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
   // func calculo(a: Material) ->
    
    @IBAction func tamanhoP(_ sender: Any) {
        botaoP.isSelected = true
        botaoM.isSelected = false
        botaoG.isSelected = false
        
        let capacidade = calcularProjecao(tam: "P")
        avisoCapacidade.text = "Você pode fazer \(capacidade) camisas"
        

    }
    
    @IBAction func tamanhoM(_ sender: Any) {
        botaoP.isSelected = false
        botaoM.isSelected = true
        botaoG.isSelected = false
        
        let capacidade = calcularProjecao (tam: "M")
        avisoCapacidade.text = "Você pode fazer \(capacidade) camisas"
        
        
    }
    
    @IBAction func tamanhoG(_ sender: Any) {
        botaoP.isSelected = false
        botaoM.isSelected = false
        botaoG.isSelected = true
        
        let capacidade = calcularProjecao(tam: "G")
        avisoCapacidade.text = "Você pode fazer \(capacidade) camisas"
        

    }
    
    

    
    func calcularProjecao (tam:String) -> Int{
        var projecao : Double = 0
        var capT : Double = 0
        var capL : Double = 0
        var capB : Double = 0
        if tam == "P"{
            capT = capacidadeTecido(tamanho: "P")
            capL = capacidadeLinha(tamanho: "P")
            capB = capacidadeBotao(tamanho: "P")
        }else if tam == "M"{
            capT = capacidadeTecido(tamanho: "M")
            capL = capacidadeLinha(tamanho: "M")
            capB = capacidadeBotao(tamanho: "M")
        }else{
            capT = capacidadeTecido(tamanho: "G")
            capL = capacidadeLinha(tamanho: "G")
            capB = capacidadeBotao(tamanho: "G")
        }
        
        if capT >= 1 && capL>=1 && capB>=1{
            if capT<capB && capT<capL{
                projecao=capT
            }else if capL<capB && capL<capT{
                projecao=capL
            }else if capB<capL && capB<capT{
                projecao=capB
            }else{
                projecao=0.0
            }
        }
        return Int(floor (projecao))
    }
    
  //Funçao para calcular capacidade de acordo com o tamanho ((Experimento))
    func capacidadeTecido (tamanho: String ) -> Double{
        var capacidade:Double = 0
        var medida: Tamanho
        
        if tamanho=="P"{
            medida = Dados.shared.medidas[0]
            dadosDefaults.tamanhoEscolhido = Dados.shared.medidas[0]
        } else if tamanho=="M"{
            medida = Dados.shared.medidas[1]
            dadosDefaults.tamanhoEscolhido = Dados.shared.medidas[1]
        } else {
            medida = Dados.shared.medidas[2]
            dadosDefaults.tamanhoEscolhido = Dados.shared.medidas[2]
        }
        
        capacidade = self.produto.tecido.quantidade/medida.quantTecido
        
        return capacidade
    }
    
    
    func capacidadeLinha (tamanho: String ) -> Double{
        var capacidade:Double = 0
        var medida: Tamanho
        
        if tamanho=="P"{
            medida = Dados.shared.medidas[0]
        } else if tamanho=="M"{
            medida = Dados.shared.medidas[1]
        } else {
            medida = Dados.shared.medidas[2]
        }
        
        capacidade = self.produto.linha.quantidade/medida.quantLinha
        
        return capacidade
    }
    
    func capacidadeBotao (tamanho: String ) -> Double{
        var capacidade:Double = 0
        var medida: Tamanho
        
        if tamanho=="P"{
            medida = Dados.shared.medidas[0]
        } else if tamanho=="M"{
            medida = Dados.shared.medidas[1]
        } else {
            medida = Dados.shared.medidas[2]
        }
        
        capacidade = self.produto.botao.quantidade/medida.quantBotao
        
        return capacidade
    }
    
}





    
/*func calcProj  (capT: Double, capL: Double, capB: Double) -> Double {
 var projecao:Double = 0
 
 if capT >= 1 && capL>=1 && capB>=1{
 if capT<capB && capT<capL{
 projecao=capT
 }else if capL<capB && capL<capT{
 projecao=capL
 }else if capB<capL && capB<capT{
 projecao=capB
 }
 }
 return floor(projecao)
 }*/



// rever isso aqui
// let quantEstTecido = Dados.shared.produtos[IndexPath.row]
// let quantEstoqueTecido = quantEstTecido.tecido


// capacidadeTecido= Dados.shared.materiais
// let quantP = Dados.shared.materiais[0]
//  print (quantP.quantidade)
