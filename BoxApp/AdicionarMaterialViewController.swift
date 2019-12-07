//
//  AdicionarMaterialViewController.swift
//  BoxApp
//
//  Created by Meyrillan Souza on 17/10/19.
//  Copyright © 2019 Feirinhas. All rights reserved.
//

import UIKit

class AdicionarMaterialViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var digitaNomeMaterial: UITextField!
    @IBOutlet weak var digitaQuantidadeMaterial: UITextField!
    @IBOutlet weak var aparecerUnidade: UILabel!
    @IBOutlet weak var tipoMaterialPicker: UIPickerView!
    
    internal var selectedByButton: Bool = false
    
    let dadosDefaults = DadosSetados.shared
    var delegateMaterial: ListaMaterialDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipoMaterialPicker.delegate =  self
        tipoMaterialPicker.dataSource = self
        
        
        
        
        // carrega os dados da celula selecionada
        if !self.selectedByButton {
            if dadosDefaults.materialEscolhido.tipo.nome == "Tecido" {
                self.tipoMaterialPicker.selectRow(0, inComponent: 0, animated: false)
            } else if dadosDefaults.materialEscolhido.tipo.nome == "Linha"  {
                self.tipoMaterialPicker.selectRow(1, inComponent: 0, animated: false)
            } else {
                self.tipoMaterialPicker.selectRow(2, inComponent: 0, animated: false)
            }
            self.digitaNomeMaterial.text = dadosDefaults.materialEscolhido.nome
            self.digitaQuantidadeMaterial.text = String(dadosDefaults.materialEscolhido.quantidade)
            self.aparecerUnidade.text = dadosDefaults.materialEscolhido.tipo.unidade
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        digitaNomeMaterial.resignFirstResponder()
        digitaQuantidadeMaterial.resignFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        digitaNomeMaterial.text = ""
        digitaQuantidadeMaterial.text = ""
        aparecerUnidade.text = ""
        tipoMaterialPicker.reloadAllComponents()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Dados.shared.tiposMaterial.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Dados.shared.tiposMaterial[row].nome
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        aparecerUnidade.text = Dados.shared.tiposMaterial[row].unidade
    }
    

    
    @IBAction func salvarMaterial(_ sender: Any) {
//        if self.selectedByButton {
            if let qt = Double(digitaQuantidadeMaterial.text!) {
                let acessoMaterial = Material (tipo: Dados.shared.tiposMaterial[tipoMaterialPicker.selectedRow(inComponent: 0)], nome: (digitaNomeMaterial?.text)!, quantidade: qt)
                delegateMaterial?.adicionar(acessoMaterial)
                
                navigationController?.popViewController(animated: true)
//        } else {
                
            
            }
        }
    }

