//
//  ReciboViewController.swift
//  Alura Ponto
//
//  Created by Ândriu Felipe Coelho on 22/09/21.
//

import UIKit
import CoreData

class ReciboViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var escolhaFotoView: UIView!
    @IBOutlet weak var reciboTableView: UITableView!
    @IBOutlet weak var fotoPerfilImageView: UIImageView!
    @IBOutlet weak var escolhaFotoButton: UIButton!
    
    // MARK: - Atributos
    
    private lazy var camera = Camera()
    private lazy var controladorDeImage = UIImagePickerController()
    
    var contexto: NSManagedObjectContext = {
        let contexto = UIApplication.shared.delegate as! AppDelegate
        
        return contexto.persistentContainer.viewContext
    }()
    
    let buscador: NSFetchedResultsController<Recibo> = {
        
        let fetchRequest: NSFetchRequest<Recibo> = Recibo.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "data", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        configuraViewFoto()
        buscador.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getRecibos()
        getFotoDePerfil()
        reciboTableView.reloadData()
    }
    
    // MARK: - Class methods
    
    func getRecibos() {
        Recibo.carregar(buscador)
    }
    
    func getFotoDePerfil() {
        if let imagemDePerfil = Perfil().carregarImagem() {
            fotoPerfilImageView.image = imagemDePerfil
        }
    }
    
    func configuraViewFoto() {
        escolhaFotoView.layer.borderWidth = 1
        escolhaFotoView.layer.borderColor = UIColor.systemGray2.cgColor
        escolhaFotoView.layer.cornerRadius = escolhaFotoView.frame.width/2
        escolhaFotoButton.setTitle("", for: .normal)
    }
    
    func configuraTableView() {
        reciboTableView.dataSource = self
        reciboTableView.delegate = self
        reciboTableView.register(UINib(nibName: "ReciboTableViewCell", bundle: nil), forCellReuseIdentifier: "ReciboTableViewCell")
    }
    
    func mostraMenuEscolhaDeFoto() {
        let menu = UIAlertController(title:"Seleção de foto", message: "Escolha uma foto da biblioteca", preferredStyle: .actionSheet)
        menu.addAction(UIAlertAction(title: "Biblioteca de fotos", style: .default, handler: {
            action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.camera.delegate = self
                self.camera.abrirBibliotecaFotos(self, self.controladorDeImage)
            }
        }))
        menu.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        present(menu, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    
    @IBAction func escolherFotoButton(_ sender: UIButton) {
        mostraMenuEscolhaDeFoto()
    }
}

extension ReciboViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buscador.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReciboTableViewCell", for: indexPath) as? ReciboTableViewCell else {
            fatalError("erro ao criar ReciboTableViewCell")
        }
        
        let recibo = buscador.fetchedObjects?[indexPath.row]
        cell.configuraCelula(recibo)
        cell.delegate = self
        cell.deletarButton.tag = indexPath.row
        
        return cell
    }
}

extension ReciboViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recibo = buscador.fetchedObjects?[indexPath.row]
        let mapaViewController = MapaViewController.instanciar(recibo)
        
        mapaViewController.modalPresentationStyle = .automatic
        
        present(mapaViewController, animated: true, completion: nil)
    }
}

extension ReciboViewController: ReciboTableViewCellDelegate {
    func deletarRecibo(_ index: Int) {
        
        AutenticacaoLocal().autorizaUsuario {
            autenticado in
            if autenticado {
                guard let recibo = self.buscador.fetchedObjects?[index] else { return }
                recibo.deletar(self.contexto)
                }
            }
        }
    }

extension ReciboViewController: CameraDelegate {
    func didSelectFoto(_ image: UIImage) {
        Perfil().salvarImagem(image)
        escolhaFotoButton.isHidden = true
        fotoPerfilImageView.image = image
    }
}

extension ReciboViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, 
        didChange anObject: Any, at indexPath: IndexPath?, for type:
        NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            if let indexPath = indexPath {
                reciboTableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        default:
            reciboTableView.reloadData()
        }
    }
}
