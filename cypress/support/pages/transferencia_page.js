class TransferenciaPage {
    preencherCampoValorTransferencia(valor) {
      cy.get('#campo-valor-transferencia').type(valor);
    }
  
    preencherCampoDestinatario(destinatario) {
      cy.get('#campo-destinatario').type(destinatario);
    }
  
    clicarBotaoTransferir() {
      cy.get('#botao-transferir').click();
    }
  
    verificarMensagemSucesso() {
      cy.get('#mensagem-sucesso').should('be.visible');
    }
  
    verificarMensagemErro(mensagem) {
      cy.get('#mensagem-erro').should('be.visible').and('contain', mensagem);
    }
  }
  
  export default TransferenciaPage;
  