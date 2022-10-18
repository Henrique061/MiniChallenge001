//
//  PersonagemConcreteBuilder.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 17/10/22.
//

import Foundation

public class PersonagemConcreteBuilder : PersonagemBuilder {
    var personagem = PersonagemFicha()
    
    //MARK: RESET
    func resetBuilder() {
        self.personagem = PersonagemFicha()
    }
    
    //MARK: NIVEL
    func setNivel(_ nivel: Int) {
        self.personagem.nivel = nivel
    }
    
    //MARK: EXPERIENCIA
    func setExperiencia(_ exp: Int) {
        self.personagem.experiencica = exp
    }
    
    //MARK: CLASSE FINAL
    func setClasseFinal(_ classeFicha: ClasseFicha) {
        self.personagem.classeFinal = classeFicha
    }
    
    //MARK: RACA FINAL
    func setRacaFinal(_ racaFicha: RacaFicha) {
        self.personagem.racaFinal = racaFicha
    }
    
    //MARK: ANTECEDENTE FINAL
    func setAntecedenteFinal(_ antecedentePersonagem: AntecedentePersonagem) {
        self.personagem.antecedenteFinal = antecedentePersonagem
    }
    
    //MARK: MAGIAS
    func setMagias(_ magias: [MagiaJSON]) {
        self.personagem.magias = magias
    }
    
    //MARK: ARMAS
    func setArmas(_ armas: [ArmaJSON]) {
        self.personagem.armas = armas
    }
    
    //MARK: ARMADURAS
    func setArmaduras(_ armaduras: [ArmaduraJSON]) {
        self.personagem.armaduras = armaduras
    }
    
    //MARK: EQUIPAMENTOS
    func setEquipamentos(_ equipamentos: [EquipamentoJSON]) {
        self.personagem.equipamentos = equipamentos
    }
    
    //MARK: FERRAMENTAS
    func setFerramentas(_ ferramentas: [FerramentaJSON]) {
        self.personagem.ferramentas = ferramentas
    }
    
    //MARK: MONTARIAS
    func setMontarias(_ montarias: [MontariaJSON]) {
        self.personagem.montarias = montarias
    }
    
    //MARK: EQUIPAMENTOS MONTARIA
    func setEquipamentosMontaria(_ equipamentos: [EquipamentoMontariaJSON]) {
        self.personagem.equipamentosMontaria = equipamentos
    }
    
    //MARK: VEICULOS AQUATICOS
    func setVeiculosAquaticos(_ veiculos: [VeiculoAquaticoJSON]) {
        self.personagem.veiculosAquaticos = veiculos
    }
    
    //MARK: BUGIGANGAS
    func setBugigangas(_ bugigangas: [BugigangaJSON]) {
        self.personagem.bugigangas = bugigangas
    }
    
    //MARK: CARTEIRA
    func setCarteira(_ carteira: [Moeda]) {
        self.personagem.carteira = carteira
    }
    
    //MARK: CLASSE ARMADURA
    func setClasseArmadura(_ ca: Int) {
        self.personagem.classeArmadura = ca
    }
    
    //MARK: INICIATIVA
    func setIniciativa(_ iniciativa: Int) {
        self.personagem.iniciativa = iniciativa
    }
    
    //MARK: DESLOCAMENTO
    func setDeslocamento(_ deslocamento: Float) {
        self.personagem.deslocamento = deslocamento
    }
    
    //MARK: PONTOS VIDA MAXIMO
    func setPontosVidaMaximo(_ pontos: Int) {
        self.personagem.pontosVidaMaximo = pontos
    }
    
    //MARK: PONTOS VIDA
    func setPontosVida(_ pontos: Int) {
        self.personagem.pontosVida = pontos
    }
    
    //MARK: PONTOS VIDA TEMPORARIO
    func setPontosVidaTemporario(_ pontos: Int) {
        self.personagem.pontosVidaTemporário = pontos
    }
    
    //MARK: DADO VIDA MAXIMO
    func setDadoVidaMaximo(_ dados: Int) {
        self.personagem.dadoVidaMaximo = dados
    }
    
    //MARK: QUANTIA DADO VIDA
    func setQuantiaDadoVida(_ quantia: Int) {
        self.personagem.quantiaDadoVida = quantia
    }
    
    //MARK: RESISTENCIA MORTE
    func setResistenciaMorte(_ resistenciaMorte: ResistenciaMorte) {
        self.personagem.resistenciaMorte = resistenciaMorte
    }
    
    //MARK: PONTOS ATRIBUTOS
    func setPontosAtributos(_ pontos: ValoresAtributos) {
        self.personagem.pontosAtributos = pontos
    }
    
    //MARK: IDIOMAS
    func setIdiomas(_ idiomas: [IdiomaAlfabeto]) {
        self.personagem.idiomas = idiomas
    }
    
    //MARK: NOME FICHA
    func setNomeFicha(_ nomeFicha: String) {
        self.personagem.nome = nomeFicha
    }
    
    //MARK: FOTO
    func setFoto(_ foto: Data?) {
        self.personagem.fotoPersonagem = foto
    }
    
    //MARK: NOME PERSONAGEM
    func setNomePersonagem(_ nome: String) {
        self.personagem.nomePersonagem = nome
    }
    
    //MARK: IDADE
    func setIdade(_ idade: Int) {
        self.personagem.idadePersonagem = idade
    }
    
    //MARK: ALTURA
    func setAltura(_ altura: Float) {
        self.personagem.alturaPersonagem = altura
    }
    
    //MARK: PESO
    func setPeso(_ peso: Float) {
        self.personagem.pesoPersonagem = peso
    }
    
    //MARK: OLHOS
    func setOlhos(_ olhos: String) {
        self.personagem.olhosPersonagem = olhos
    }
    
    //MARK: PELE
    func setPele(_ pele: String) {
        self.personagem.pelePersonagem = pele
    }
    
    //MARK: CABELO
    func setCabelo(_ cabelo: String) {
        self.personagem.cabeloPersonagem = cabelo
    }
    
    //MARK: OUTROS
    func setOutros(_ outros: String) {
        self.personagem.outrosPersonagem = outros
    }
    
    //MARK: TRACOS
    func setTracosPersonalidade(_ tracos: String) {
        self.personagem.tracosPersonalidadePersonagem = tracos
    }
    
    //MARK: IDEAIS
    func setIdeais(_ ideais: String) {
        self.personagem.ideaisPersonagem = ideais
    }
    
    //MARK: VINCULO
    func setVinculo(_ vinculo: String) {
        self.personagem.vinculoPersonagem = vinculo
    }
    
    //MARK: DEFEITOS
    func setDefeitos(_ defeitos: String) {
        self.personagem.defeitosPersonagem = defeitos
    }
    
    //MARK: TENDENCIA
    func setTendencia(_ tendencia: TipoTendencia) {
        self.personagem.tendenciaPersonagem = tendencia
    }
    
    //MARK: ESTILO VIDA
    func setEstiloVida(_ estilo: EstiloDeVida) {
        self.personagem.estiloVida = estilo
    }
    
    //MARK: PROF SALVAGUARDAS
    func setProfSalvaguardas(_ salvaguardas: [AtributosSalvaguarda]) {
        self.personagem.profSalvaguardas = salvaguardas
    }
    
    //MARK: PROF PERICIAS
    func setProfPericias(_ pericias: [Pericia]) {
        self.personagem.profPericias = pericias
    }
    
    //MARK: PROF ARMAS
    func setProfArmas(_ armas: [ArmaJSON]) {
        self.personagem.profArmas = armas
    }
    
    //MARK: PROF ARMADURAS
    func setProfArmadura(_ armaduras: [ArmaduraJSON]) {
        self.personagem.profArmaduras = armaduras
    }
    
    //MARK: PROF FERRAMENTAS
    func setProfFerramentas(_ ferramentas: [FerramentaJSON]) {
        self.personagem.profFerramentas = ferramentas
    }
    
    //MARK: GET FINAL
    func getPersonagemFicha() -> PersonagemFicha {
        let buildedPersonagem = self.personagem
        resetBuilder()
        return buildedPersonagem
    }
}
