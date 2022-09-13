//
//  ContentView.swift
//  MiniChallenge001
//
//  Created by Henrique Batista de Assis on 12/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    // organiza os dados em tempo real na UI, organizando pelo Item.timestamp
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    // fetch request sem nenhum sort
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Arma.id, ascending: true)])
    var armas: FetchedResults<Arma>


    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
        
        Button("Add Random Arma") {
            addArma()
        }
        
        Button("Remove primeira arma") {
            deletePrimeiraArma()
        }
        
        Button("Remove TODAS as armas") {
            deleteAllArmas()
        }
        
        Button("Printa as arma garai") {
            print("NOVO PRINT\n")
            armas.forEach { arma in
                print("""
                        ID: \(arma.id)
                        Nome: \(arma.nome!)
                        Tipo: \(arma.tipo!)
                        Estilo: \(arma.estilo!)
                        Preco Qtd: \(arma.precoQtd)
                        Preco Tipo: \(arma.precoTipo!)
                        Dano dado: \(arma.danoDado!)
                        Dano tipo: \(arma.danoTipo!)
                        Peso: \(arma.peso)kg
                        Propriedades: \(arma.propriedades!)
                        
                        --------------------------------------------
                        
                        """)
            }
        }
        
        .onAppear {
            print("Começou o app")
//            JSONFilesUtils.getDataFromFiles(folder: "armas", decoder: ArmaJSON.self).forEach { arma in
//                let aux = arma as! ArmaJSON
//                print(aux.peso)
//            }
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
    
    private func addArma() {
        var armaRandom: ArmaJSON
        armaRandom = JSONFilesUtils.getDataFromFiles(folder: "armas", decoder: ArmaJSON.self).randomElement() as! ArmaJSON
        
        let newArma = Arma(context: viewContext)
        
        newArma.id = Int64(armaRandom.id)
        newArma.nome = armaRandom.nome
        newArma.tipo = armaRandom.tipo.rawValue
        newArma.estilo = armaRandom.estilo.rawValue
        newArma.precoQtd = Int64(armaRandom.preco.quantidade)
        newArma.precoTipo = armaRandom.preco.tipo.rawValue
        newArma.danoDado = armaRandom.dano.dano
        newArma.danoTipo = armaRandom.dano.tipo.rawValue
        newArma.peso = armaRandom.peso
        newArma.propriedades = armaRandom.propriedades
        
        do {
            try viewContext.save()
            print("\(newArma.nome!) adicionada.")
        } catch {
            print("Deu ruim pra add uma arma random.")
        }
    }
    
    private func deletePrimeiraArma() {
        if !armas.isEmpty {
            let armaDelete = armas[0]
            let nomeArmaDelete = armas[0].nome
            viewContext.delete(armaDelete)
            
            do {
                try viewContext.save()
                print("\(nomeArmaDelete!) removida.")
            } catch {
                print("Deu ruim pra salvar no delete primeira arma.")
            }
        }
        
        else {
            print("Armas ta vazia garai.")
        }
    }
    
    private func deleteAllArmas() {
        if !armas.isEmpty {
            armas.forEach { arma in
                viewContext.delete(arma)
            }
            
            do {
                try viewContext.save()
                print("Todas armas removidas.")
            } catch {
                print("Deu ruim pra salvar no delete todas as armas.")
            }
        }
        
        else {
            print("Armas ta vazia garai")
        }
    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
