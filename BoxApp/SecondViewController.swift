//
//  SecondViewController.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 16/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import UIKit
var linhaTeste = Material(tipo:Tipo (nome:"Linha", unidade: "Centímetros"), nome:"Linha azul", quantidade: 30)

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ProdutosTableView: UITableView!
    
    let dadosDefaults = DadosSetados.shared
    
    var produtos: [Produto] = [Produto(nomeProduto: "camisaazul", tecido:linhaTeste, linha: linhaTeste, botao: linhaTeste)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProdutosTableView.delegate = self
        ProdutosTableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ProdutosTableView.reloadData()
    }
    
    
    @IBAction func botaoAdicionarProduto(_ sender: Any) {
        
    }
   
 //Enviar tela para editar produto ao clicar na TableView de Produtos
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dadosDefaults.produtoEscolhido = dadosDefaults.produtos[indexPath.row]
        performSegue(withIdentifier: "EditarProduto", sender: dadosDefaults.produtoEscolhido)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadosDefaults.produtos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cellProdutos = tableView.dequeueReusableCell(withIdentifier: "CelulaProdutos", for: indexPath) as! ProdutoTableViewCell
        cellProdutos.nomeDeProduto.text = dadosDefaults.produtos[indexPath.row].nomeProduto
        cellProdutos.layer.cornerRadius = 5
        
        cellProdutos.produto = dadosDefaults.produtos[indexPath.row]
        
        
        return cellProdutos
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    
    
    
}

