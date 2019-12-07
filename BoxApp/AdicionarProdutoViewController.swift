//
//  AdicionarProdutoViewController.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 17/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import UIKit

class AdicionarProdutoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var digitaNomeProduto: UITextField!
    @IBOutlet weak var escolherTecidoTableView: UITableView!
    @IBOutlet weak var escolherLinhaTableView: UITableView!
    @IBOutlet weak var escolherBotaoTableView: UITableView!
    
    let dadosDefaults = DadosSetados.shared
    
    var delegateProduto: ListaProdutoDelegate? = nil
    
    var todasAsLinhas: [Material] = []
    var todosOsTecidos: [Material] = []
    var todosOsBotoes: [Material] = []
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {3
        digitaNomeProduto.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        escolherTecidoTableView.layer.cornerRadius = 5
        escolherLinhaTableView.layer.cornerRadius = 5
        escolherBotaoTableView.layer.cornerRadius = 5

        for mat in dadosDefaults.materiais{
            if mat.tipo.nome == "Linha"{
                todasAsLinhas.append(mat)
            }else if mat.tipo.nome == "Tecido"{
                    todosOsTecidos.append(mat)
            }else if mat.tipo.nome == "Botão"{
                todosOsBotoes.append(mat)
            }
        }
        
        escolherTecidoTableView.delegate = self
        escolherTecidoTableView.dataSource = self
        escolherLinhaTableView.delegate = self
        escolherLinhaTableView.dataSource = self
        escolherBotaoTableView.delegate = self
        escolherBotaoTableView.dataSource = self
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var elementos = 0
        if tableView == escolherTecidoTableView {
            elementos = todosOsTecidos.count
        }else if tableView == escolherLinhaTableView {
             elementos = todasAsLinhas.count
        }else if tableView == escolherBotaoTableView {
            elementos = todosOsBotoes.count
        }
        return elementos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var finalCell = UITableViewCell()
        
        if tableView == escolherTecidoTableView{
            let cellTecido = tableView.dequeueReusableCell(withIdentifier: "AdicionarTiposTecido") as! AdicionarTiposTecidoTableViewCell
            cellTecido.nomeTecido.text = todosOsTecidos[indexPath.row].nome
            
            finalCell = cellTecido
            
        } else if tableView == escolherLinhaTableView{
            
            let cellLinha = tableView.dequeueReusableCell(withIdentifier: "AdicionarTiposLinhas") as! AdicionarTiposLinhaTableViewCell
            cellLinha.nomeLinha.text = todasAsLinhas[indexPath.row].nome
            
            finalCell = cellLinha
            
        }else if tableView == escolherBotaoTableView{
            
            let cellBotao = tableView.dequeueReusableCell(withIdentifier: "AdicionarTiposBotoes") as! AdicionarTiposBotaoTableViewCell
            cellBotao.nomeBotao.text = todosOsBotoes[indexPath.row].nome
            
            finalCell = cellBotao
        }
        
        return finalCell
    }
 
    @IBAction func salvarProduto(_ sender: Any) {
        if let nome = digitaNomeProduto.text {
            let acessoProduto = Produto(nomeProduto: nome, tecido: todosOsTecidos [escolherTecidoTableView.indexPathForSelectedRow!.row], linha: todasAsLinhas[escolherLinhaTableView.indexPathForSelectedRow!.row], botao: todosOsBotoes[escolherBotaoTableView.indexPathForSelectedRow!.row])
            dadosDefaults.produtos.append(acessoProduto)
            navigationController?.popViewController(animated: true)
        }
        
    }

}


