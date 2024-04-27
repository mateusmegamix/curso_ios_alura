//
//  Perfil.swift
//  Alura Ponto
//
//  Created by Mateus Pereira on 09/04/24.
//

import Foundation
import UIKit

class Perfil {
    
    private let nomeDaFoto = "perfil.png"

    func salvarImagem(_ imagem: UIImage) {
        guard let diretorio = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first
        else { return }
        
        let urlDoArquivo = diretorio.appendingPathComponent(nomeDaFoto)
        
        if FileManager.default.fileExists(atPath: urlDoArquivo.path) {
            removerImagemAntiga(urlDoArquivo.path)
        }
        
        guard let imagemData = imagem.jpegData(compressionQuality: 1) else { return }
        
        do {
            try imagemData.write(to: urlDoArquivo)
        } catch let error {
            print(error)
        }
    }
    private func removerImagemAntiga(_ url: String) {
        do {
            try FileManager.default.removeItem(atPath: url)
        } catch let error {
            print(error)
        }
    }
    
    func carregarImagem() -> UIImage? {
        
        let diretorio = FileManager.SearchPathDirectory.documentDirectory
        let userDoaminMask = FileManager.SearchPathDomainMask.userDomainMask
        
        let urlDoArquivo = NSSearchPathForDirectoriesInDomains(diretorio, userDoaminMask, true)
        
        if let caminho = urlDoArquivo.first {
            let urlDaImagem = URL(fileURLWithPath: caminho)
                .appendingPathComponent(nomeDaFoto)
            
            let imagem = UIImage(contentsOfFile: urlDaImagem.path)
            
            return imagem
        }
        return nil
    }
}
