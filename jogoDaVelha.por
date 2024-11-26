programa {
  funcao inicio() {
    inteiro opcaoAtual = 0

    faca{
      opcaoAtual = exibirMenu()
      escolha (opcaoAtual) {
        caso 1:
          jogarPartida()
        caso 2:
          escolherNomesDosJogadores()
        caso 3:
          mostrarPlacarAtual()
        caso 4:
          estatisticasGerais()
        caso5
      }

    } enquanto(opcaoAtual != 5)

    //Jogador 1 e X e o jogador 2 o O

    //Ao final de uma partida, o programa deve informar quem ganhou, ou se deu velha

    //O jogo então deve voltar para o menu inicial, proporcionando novamente o menu na tela com as opções

    //A opção 2 deve permitir o cadastro dos nomes dos jogadores. Sempre que um jogador receber um novo nome, o placar deverá ser reiniciado para zero

    //A opção ‘Placar atual’ deve mostrar quantas vezes o jogador 1 e o jogador 2 venceram uma partida. Ambos devem começar com 0 pontos.
  }

  funcao inteiro exibirMenu(){
    inteiro opcaoEscolhida = 0
    
    escreva("     Jogo Da Velha\n######################\n1. Jogar uma partida\n2. Escolher nomes dos jogadores\n3. Placar atual\n4. Estatísticas gerais\n5. Sair do programa\n")
    leia(opcaoEscolhida)

    retorne opcaoEscolhida
  }
}
