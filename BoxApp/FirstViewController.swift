//
//  FirstViewController.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 16/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ListaMaterialDelegate {
    
    @IBOutlet weak var materiaisCollectionView: UICollectionView!
    
    let dadosDefaults = DadosSetados.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        materiaisCollectionView.delegate = self
        materiaisCollectionView.dataSource = self
        
    }
    
    @IBAction func botaoAdicionarMaterial(_ sender: Any) {
//        dadosDefaults.materialEscolhido = dadosDefaults.materiais
        performSegue(withIdentifier: "DeCollectionParaDetalhes", sender: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dadosDefaults.materiais.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaMateriais", for: indexPath) as! MateriaisCollectionViewCell
       
        if dadosDefaults.materiais[indexPath.row].tipo.nome == "Tecido" {
            cell.iconeTipoMaterial.image = #imageLiteral(resourceName: "tecido")
        } else if dadosDefaults.materiais[indexPath.row].tipo.nome == "Linha"{
            cell.iconeTipoMaterial.image = #imageLiteral(resourceName: "linha")
        } else {
            cell.iconeTipoMaterial.image = #imageLiteral(resourceName: "botao")
        }
        
        cell.nomeDeMaterial.text = dadosDefaults.materiais[indexPath.row].nome
        cell.quantidadeDeMaterial.text = String(dadosDefaults.materiais[indexPath.row].quantidade)
        cell.layer.cornerRadius = 5
        return cell
    }
    
   //Enviar tela para editar produto ao clicar na CollectionView de Materiais
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dadosDefaults.materialEscolhido = dadosDefaults.materiais[indexPath.row]
        
        performSegue(withIdentifier: "EditarMateriais", sender: dadosDefaults.materialEscolhido)
    }
    
    func adicionar(_ material: Material) {
        dadosDefaults.materiais.append(material)
        materiaisCollectionView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let adicionarMaterialVc = segue.destination as? AdicionarMaterialViewController {
            if segue.identifier! == "DeCollectionParaDetalhes" {
                    adicionarMaterialVc.selectedByButton = true
            }
            /* if dadosDefaults.materialEscolhido.tipo.nome == "Tecido" {
             adicionarMaterialVc.tipoMaterialPicker.selectRow(0, inComponent: 0, animated: false)
             } else if dadosDefaults.materialEscolhido.tipo.nome == "Linha"  {
             adicionarMaterialVc.tipoMaterialPicker.selectRow(1, inComponent: 0, animated: false)
             } else {
             adicionarMaterialVc.tipoMaterialPicker.selectRow(2, inComponent: 0, animated: false)
             }
             adicionarMaterialVc.digitaNomeMaterial.text = dadosDefaults.materialEscolhido.nome
             adicionarMaterialVc.digitaQuantidadeMaterial.text = String(dadosDefaults.materialEscolhido.quantidade) */
            
            adicionarMaterialVc.delegateMaterial = self
            
            // materiaisCollectionView.indexPathsForSelectedItems
            // materiaisCollectionView = Material[IndexPath.row]
        }
        
    }
}

