//
//  DadosSetados.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 24/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import Foundation


class DadosSetados{
    let defaults = UserDefaults.standard
    static let shared: DadosSetados = DadosSetados()
    
    var tipos: [Tipo] {
        get{
            let dataTipos = defaults.value(forKey: "tipos") as! Data
            let tiposSalvos = try! PropertyListDecoder().decode(Array<Tipo>.self, from: dataTipos)
            return tiposSalvos
        }
        set(novosTipos){
            let encodedArray = try! PropertyListEncoder().encode(novosTipos)
            defaults.set(encodedArray, forKey: "tipos")
        }
    }
    
    var materialEscolhido: Material {
        get{
            let dataMaterialEscolhido = defaults.value(forKey: "materialEscolhido")
            let materialSalvo = try! PropertyListDecoder().decode(Material.self, from: dataMaterialEscolhido as! Data)
            return materialSalvo
        }
        set(novosMateriais){
            let encodedArray = try! PropertyListEncoder().encode(novosMateriais)
            defaults.set(encodedArray, forKey: "materialEscolhido")
        }
    }
    
    var materiais: [Material] {
        get{
            if let dataMateriais = defaults.value(forKey: "materiais") {
                let materiaisSalvos = try! PropertyListDecoder().decode(Array<Material>.self, from: dataMateriais as! Data)
                return materiaisSalvos
            } else {
                return []
            }
        }
        set(novosMateriais){
            let encodedArray = try! PropertyListEncoder().encode(novosMateriais)
            defaults.set(encodedArray, forKey: "materiais")
        }
        
    }
    
    var produtos: [Produto] {
        get{
            if let dataProdutos = defaults.value(forKey: "produtos") {
                let produtosSalvos = try! PropertyListDecoder().decode(Array<Produto>.self, from: dataProdutos as! Data)
                return produtosSalvos
            } else {
                return []
            }
        }
        set(novosProdutos){
            let encodedArray = try! PropertyListEncoder().encode(novosProdutos)
            defaults.set(encodedArray, forKey: "produtos")
        }
    }
  //Mudar a tela pra editar produto ao clicar na tableView de Produtos
    var produtoEscolhido: Produto {
        get{
                let dataProdutoEscolhido = defaults.value(forKey: "produtoEscolhido")
            if let produtoSalvo = try? PropertyListDecoder().decode(Produto.self, from: (dataProdutoEscolhido as! Data))  {
                return produtoSalvo
            } else {
                return Produto.produtovazio
            }
            
        }
        set(novosProdutos){
            let encodedArray = try! PropertyListEncoder().encode(novosProdutos)
            defaults.set(encodedArray, forKey: "produtoEscolhido")
        }
 
    }
    
    var tamanhoEscolhido: Tamanho {
        get{
            let dataTamanhoEscolhido = defaults.value(forKey: "tamanhoEscolhido")
            let tamanhoSalvo = try! PropertyListDecoder().decode(Tamanho.self, from: dataTamanhoEscolhido as! Data)
            return tamanhoSalvo
            
        }
        set(novoTamanho){
            let encodedArray = try! PropertyListEncoder().encode(novoTamanho)
            defaults.set(encodedArray, forKey: "tamanhoEscolhido")
        }
        
    }
    
    
    
}

