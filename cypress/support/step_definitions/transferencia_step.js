/// <reference types="cypress" />

import { Given, When, And, Then } from "cypress-cucumber-preprocessor/steps";
import TransferenciaPage  from "../pages/transferencia_page";

// Automação do Cenário 04 de sucesso e Cenário 06 de erro 

// Cenário 04 - Realizar a transferência para destinatários cadastrados

Given("estou na tela de transferência", () => {
	cy.visit('/tela-de-transferencia');
});

And("dentro do horário permitido das 08:00hs às 20:00hs", () => {
	cy.clock(new Date('2024-05-26T15:00:00')); // Relógio configurado para 15hs
});

When("tentar realizar uma transferência com valor máximo de R$5.000,00", () => {
	preencherCampoValorTransferencia(valor);
	preencherCampoDestinatario(destinatario);
	clicarBotaoTransferir()
});

Then("vejo uma mensagem de sucesso", () => {
	verificarMensagemSucesso();
});

// Cenário 06 - Não realizar transferência para destinatários cadastrados com valores acima do permitido 

Given("estou na tela de transferência", () => {
	cy.visit('/tela-de-transferencia');
});

And("dentro do horário permitido das 08:00hs às 20:00hs", () => {
	cy.clock(new Date('2024-05-26T14:00:00')); // Configurar o relógio para 14hs
});

When("tentar realizar uma transferência com valor acima de R$5.000,00", () => {
    preencherCampoValorTransferencia(valor);
	preencherCampoDestinatario(destinatario);
	clicarBotaoTransferir();
});

Then("vejo uma mensagem de erro", () => {
	verificarMensagemErro();
});


