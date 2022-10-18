//
//  PersonagemBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 21/09/22.
//

import Foundation
import SwiftUI

//MARK: PersonagemBuilder
protocol PersonagemBuilder {
    func resetBuilder()
    
    //MARK: NIVEIS
    func setNivel(_ nivel: Int)
    func setExperiencia(_ exp: Int)
    
    //MARK: CLASSES
    func setClasseFinal(_ classeFicha: ClasseFicha)
    func setRacaFinal(_ racaFicha: RacaFicha)
    func setAntecedenteFinal(_ antecedentePersonagem: AntecedentePersonagem)
    
    //MARK: INVENTARIO
    func setMagias(_ magias: [MagiaJSON])
    func setArmas(_ armas: [ArmaJSON])
    func setArmaduras(_ armaduras: [ArmaduraJSON])
    func setEquipamentos(_ equipamentos: [EquipamentoJSON])
    func setFerramentas(_ ferramentas: [FerramentaJSON])
    func setMontarias(_ montarias: [MontariaJSON])
    func setEquipamentosMontaria(_ equipamentos: [EquipamentoMontariaJSON])
    func setVeiculosAquaticos(_ veiculos: [VeiculoAquaticoJSON])
    func setBugigangas(_ bugigangas: [BugigangaJSON])
    func setCarteira(_ carteira: [Moeda])
    
    //MARK: PONTOS
    func setClasseArmadura(_ ca: Int)
    func setIniciativa(_ iniciativa: Int)
    func setDeslocamento(_ deslocamento: Float)
    func setPontosVidaMaximo(_ pontos: Int)
    func setPontosVida(_ pontos: Int)
    func setPontosVidaTemporario(_ pontos: Int)
    func setDadoVidaMaximo(_ dados: Int)
    func setQuantiaDadoVida(_ quantia: Int)
    func setResistenciaMorte(_ resistenciaMorte: ResistenciaMorte)
    func setPontosAtributos(_ pontos: ValoresAtributos)
    func setIdiomas(_ idiomas: [IdiomaAlfabeto])
    
    //MARK: PERFIL
    func setNomeFicha(_ nomeFicha: String)
    func setFoto(_ foto: Data?)
    func setNomePersonagem(_ nome: String)
    func setIdade(_ idade: Int)
    func setAltura(_ altura: Float)
    func setPeso(_ peso: Float)
    func setOlhos(_ olhos: String)
    func setPele(_ pele: String)
    func setCabelo(_ cabelo: String)
    func setOutros(_ outros: String)
    func setTracosPersonalidade(_ tracos: String)
    func setIdeais(_ ideais: String)
    func setVinculo(_ vinculo: String)
    func setDefeitos(_ defeitos: String)
    func setTendencia(_ tendencia: TipoTendencia)
    func setEstiloVida(_ estilo: EstiloDeVida)
    
    //MARK: PROFICIENCIAS
    func setProfSalvaguardas(_ salvaguardas: [AtributosSalvaguarda])
    func setProfPericias(_ pericias: [Pericia])
    func setProfArmas(_ armas: [ArmaJSON])
    func setProfArmadura(_ armaduras: [ArmaduraJSON])
    func setProfFerramentas(_ ferramentas: [FerramentaJSON])
    
//    self.vmficha.ficha.pontosAtributos.carisma = self.vmatributo.atributos[0].valor
//    self.vmficha.ficha.pontosAtributos.constituicao = self.vmatributo.atributos[1].valor
//    self.vmficha.ficha.pontosAtributos.destreza = self.vmatributo.atributos[2].valor
//    self.vmficha.ficha.pontosAtributos.forca = self.vmatributo.atributos[3].valor
//    self.vmficha.ficha.pontosAtributos.inteligencia = self.vmatributo.atributos[4].valor
//    self.vmficha.ficha.pontosAtributos.sabedoria = self.vmatributo.atributos[5].valor
//
//    do {
//        vmficha.ficha.id = try JsonFileUtil.getNewIdForSheet()
//        try JsonFileUtil.write(content: vmficha.ficha)
//    } catch {
//        print("UNABLE TO CREATE A NEW ID TO SHEET: \(error.localizedDescription)")
//    }
}
