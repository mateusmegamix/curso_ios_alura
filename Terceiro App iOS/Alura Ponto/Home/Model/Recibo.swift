//
//  Recibo.swift
//  Alura Ponto
//
//  Created by Ândriu Felipe Coelho on 29/09/21.
//

import Foundation
import UIKit
import CoreData

@objc(Recibo)
class Recibo: NSManagedObject {
    
    @NSManaged var id: UUID
    @NSManaged var status: Bool
    @NSManaged var data: Date
    @NSManaged var foto: UIImage
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    
    convenience init(status: Bool, data: Date, foto: UIImage, latitude: Double, longitude: Double) {
        let contexto = UIApplication.shared.delegate as! AppDelegate
        self.init(context: contexto.persistentContainer.viewContext)
        self.id = UUID()
        self.status = status
        self.data = data
        self.foto = foto
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Recibo {
    
    class func fetchRequest() -> NSFetchRequest<Recibo> {
        return NSFetchRequest(entityName: "Recibo")
    }
    
    func salvar(_ contexto: NSManagedObjectContext) {
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    class func carregar(_ fetchedResultController: NSFetchedResultsController<Recibo>) {
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deletar(_ contexto: NSManagedObjectContext) {
        contexto.delete(self)
        
        do {
            try contexto.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
