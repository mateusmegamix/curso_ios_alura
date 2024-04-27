//
//  AutenticacaoLocal.swift
//  Alura Ponto
//
//  Created by Mateus Pereira on 09/04/24.
//

import Foundation
import LocalAuthentication

class AutenticacaoLocal {
    private let autenticatorContext = LAContext()
    private var error: NSError?
    
    func autorizaUsuario(completion: @escaping(_ autenticacao: Bool) -> Void) {
        
        if autenticatorContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            autenticatorContext.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "É necessário autenticação para apagar um recibo") {
                    sucesso, error in
                completion(sucesso)
            }
        }
    }
    
}
