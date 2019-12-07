//
//  Modelos.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 17/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import UIKit


struct Tipo: Codable {
    var nome: String
    var unidade: String
    init(nome: String, unidade: String) {
        self.nome = nome
        self.unidade = unidade
    }
    
}
// estrutura que guarda os materiais no estoque

struct Material: Codable {
    var tipo: Tipo
    var nome: String
    var quantidade: Double
    
    init(tipo: Tipo, nome: String, quantidade: Double) {
        self.tipo = tipo
        self.nome = nome
        self.quantidade = quantidade
    }
}

struct Produto: Codable {
    var nomeProduto: String
    var tecido: Material
    var linha: Material
    var botao: Material
    
    static var produtovazio: Produto = Produto(nomeProduto: "", tecido: Material(tipo: Tipo(nome: "", unidade: ""), nome: "", quantidade: 0), linha: Material(tipo: Tipo(nome: "", unidade: ""), nome: "", quantidade: 0), botao: Material(tipo: Tipo(nome: "", unidade: ""), nome: "", quantidade: 0))
    
    init(nomeProduto: String, tecido: Material, linha: Material, botao: Material) {
        self.nomeProduto = nomeProduto
        self.tecido = tecido
        self.linha = linha
        self.botao = botao
    }
}


// estrutura das tables de adicionar camisa (recebe as informaçoes do array material)

struct Tamanho:Codable {
    var nomeTam: String
    var quantTecido: Double
    var quantLinha: Double
    var quantBotao: Double
}
// estrutura dos botões P, M e G

class Dados {
    static let shared = Dados()
    var tiposMaterial: [Tipo] = []
    var medidas: [Tamanho] = []
    init() {
        let tecido = Tipo (nome:"Tecido", unidade: "Metros")
        let linha = Tipo (nome:"Linha", unidade: "Metros")
        let botao = Tipo (nome:"Botão", unidade: "Unidades")
        tiposMaterial = [tecido, linha, botao]
        medidas.append(Tamanho(nomeTam: "P", quantTecido: 1.3, quantLinha: 5, quantBotao: 8))
        medidas.append(Tamanho(nomeTam: "M", quantTecido: 1.5, quantLinha: 7, quantBotao: 8))
        medidas.append(Tamanho(nomeTam: "G", quantTecido: 1.7, quantLinha: 9, quantBotao: 9))
    }
    
}

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make unselected icons white
        self.tabBar.unselectedItemTintColor = UIColor.darkGray
    }
}
/*/ struct ProdutoTableView {
 var nomeCell:Produto
 var estimativa:String
 }/**/*/
