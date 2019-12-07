//
//  PopUpViewController.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 29/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var camisasProduzidas: UITextField!
    @IBOutlet weak var botaoSalvar: UIButton!
    
    let dadosDefaults = DadosSetados.shared
    var produto:Produto = Produto.produtovazio
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        botaoSalvar.layer.cornerRadius = 3
        
        // popUpView.layer.cornerRadius = 10
        // popUpView.layer.masksToBounds = true
        
    }
    
    @IBAction func salvar(_ sender: Any) {
        let camisasFeitas = Double(camisasProduzidas.text!)!
        
        //reduzirMateriais(quantCamisas: camisasFeitas)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func reduzirMateriais(quantCamisas: Double) {
        produto = dadosDefaults.produtoEscolhido
        var materiais = dadosDefaults.materiais
        let tecidoGasto = quantCamisas * produto.tecido.quantidade
        let linhaGasta = quantCamisas * produto.linha.quantidade
        let botaoGasto = quantCamisas * produto.botao.quantidade
        
        for indiceMaterial in 0...materiais.count-1 {
            if materiais[indiceMaterial].tipo.nome == produto.tecido.nome {
                materiais[indiceMaterial].quantidade = materiais[indiceMaterial].quantidade - tecidoGasto
            } else if materiais[indiceMaterial].tipo.nome == produto.linha.nome {
                materiais[indiceMaterial].quantidade = materiais[indiceMaterial].quantidade - linhaGasta
            } else if materiais[indiceMaterial].tipo.nome == produto.botao.nome {
                materiais[indiceMaterial].quantidade = materiais[indiceMaterial].quantidade - botaoGasto
            }
        }
    }
    
}




