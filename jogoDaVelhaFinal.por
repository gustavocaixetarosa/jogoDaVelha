programa {
  //inicializa valores inteiros globais
  inteiro partidasJogadas = 0, rodadaAtual = 0
  inteiro vitoriasJogadorUm = 0, vitoriasJogadorDois = 0, maiorNumeroVitorias = 0

  //inicializa um tabuleiro 3x3
  caracter tabuleiro[3][3]

  //define simbolos dos jogadores e o simbolo da jogada atual
  caracter simboloJogadorUm = 'X', simboloJogadorDois = 'O', simboloJogadorAtual

  //define variaveis para os nomes, incluindo maior vencedor
  cadeia nomeJogadorUm, nomeJogadorDois, nomeJogadorAtual, nomeMaiorVencedor

  //verifica se devemos fazer outra jogadaa
  logico partidaEmAndamento = verdadeiro

  funcao inicio() {
    //chama funcao que mostra o menu
    exibirMenu()
  }

  //a cada rodada atualiza as variaveis com base no numero da rodada atual. rodadas pares sao do 'X'.
  funcao atualizaJogadorAtual(){
    se(rodadaAtual % 2 == 0){
      simboloJogadorAtual = simboloJogadorUm
      nomeJogadorAtual = nomeJogadorUm
    } senao {
      simboloJogadorAtual = simboloJogadorDois
      nomeJogadorAtual = nomeJogadorDois
    }
  }

  //valida se a jogada desejada e possivel e, caso seja, a registra no tabuleiro
  funcao computaJogada(inteiro linha, inteiro coluna){
    se(linha > 3 ou linha < 1 ou coluna < 1 ou coluna > 3){
      escreva("\n\n----------------ATENÇÃO---------------------\nJogada fora do tabuleiro! Tente de novo:\n--------------------------------------------\n\n")
      realizarJogada()
    } senao
    se(tabuleiro[linha - 1][coluna - 1] != ' '){
      escreva("\n\n----------------ATENÇÃO---------------------\nCasa ja foi escolhida. Escolha outra jogada!\n--------------------------------------------\n\n")
      realizarJogada()
    } senao{
      tabuleiro[linha - 1][coluna - 1] = simboloJogadorAtual
    }
  }

  //faz o contagem das vitorias e verifica se temos um novo recorde
  funcao computaVitoria(){
    se(simboloJogadorAtual == 'X'){
      vitoriasJogadorUm++
      se(vitoriasJogadorUm > maiorNumeroVitorias){
        nomeMaiorVencedor = nomeJogadorUm
        maiorNumeroVitorias = vitoriasJogadorUm
      }
    } senao {
      vitoriasJogadorDois++
      se(vitoriasJogadorUm > maiorNumeroVitorias){
        nomeMaiorVencedor = nomeJogadorUm
        maiorNumeroVitorias = vitoriasJogadorUm
      }
    }
    partidasJogadas++
  }

  //altera os nomes dos jogadores
  funcao escolherNomesDosJogadores(){
    escreva("Qual o nome do primeiro jogador?\n")
    leia(nomeJogadorUm)
    vitoriasJogadorUm = 0

    escreva("Qual o nome do segundo jogador?\n")
    leia(nomeJogadorDois)
    vitoriasJogadorDois = 0
  }

  //exibe o maior campeao da sessao
  funcao estatisticasGerais(){
    escreva("\n\nMaior vencedor: " + nomeMaiorVencedor + "!\nVitorias: " + maiorNumeroVitorias + "\n\n")

    exibirMenu()
  }

  funcao exibirMenu(){
    inteiro opcaoEscolhida = 0
    
    escreva("     Jogo Da Velha\n######################\n1. Jogar uma partida\n2. Escolher nomes dos jogadores\n3. Placar atual\n4. Estatísticas gerais\n5. Sair do programa\n")
    leia(opcaoEscolhida)

    escolha (opcaoEscolhida) {
        caso 1:
          jogarPartida()
        caso 2:
          escolherNomesDosJogadores()
        caso 3:
          mostrarPlacarAtual()
        caso 4:
          estatisticasGerais()
        caso 5:
          finalizarJogo()
      }
  }

  //representa graficamente o tabuleiro
  funcao exibirTabuleiro(){
    escreva("\n\n")

    para(inteiro i = 0; i < 3; i++){
      escreva(" " + tabuleiro[i][0] + " | " + tabuleiro[i][1] + " | " + tabuleiro[i][2] + " \n")
      se(i != 2){
        escreva("-----------\n")
      }
    }

    escreva("\n\n")
  }

  funcao finalizarJogo(){
    escreva("Até a próxima!\nFinalizando programa...")
  }

  //inicializa o fluxo da partida
  funcao jogarPartida(){
    //reset das configuracoes iniciais de uma partida
    partidaEmAndamento = verdadeiro
    rodadaAtual = 0

    //verifica se precisamos inicializar os nomes dos jogadores
    se(partidasJogadas == 0){
      escolherNomesDosJogadores()
    }

    //reseta o tabuleiro
    limparTabuleiro()

    //enquanto a partida nao acabou, repete os processos para mais uma jogada
    enquanto (partidaEmAndamento){
      realizarJogada()
      verificaSituacaoDaPartida()
      exibirTabuleiro()
    }

    exibirMenu()
  }

  //reseta o tabuleiro
  funcao limparTabuleiro(){
    para(inteiro i = 0; i < 3; i++){
      para(inteiro j = 0; j < 3; j++){
        tabuleiro[i][j] = ' '
      }
    }
  }

  //imprime os jogadores atuais e suas respectivas vitorias
  funcao mostrarPlacarAtual(){
    se(partidasJogadas == 0){
      escolherNomesDosJogadores()
    }
    escreva("\n\n *** PLACAR ATUAL ***\n" + nomeJogadorUm + " --- " + vitoriasJogadorUm + " vitórias!\n" + nomeJogadorDois + " --- " + vitoriasJogadorDois + " vitórias!\n\n\n")
    exibirMenu()
  }

  //indica o inicio de uma nova rodada anuncionando de quem e a vez 
  funcao realizarJogada(){
    inteiro linha = 0, coluna = 0

    atualizaJogadorAtual()
    escreva("\nVez do jogador " + nomeJogadorAtual + " que joga com as peças " + simboloJogadorAtual + ": \n\n")
    escreva("Digite a linha e a coluna, respectivamente, que deseja jogar:\n")
    leia(linha, coluna)

    computaJogada(linha, coluna)
  }

  //verifica a situacao atual da partida
  funcao verificaSituacaoDaPartida(){
    para(inteiro i = 0; i < 3; i++){
      //caso em que uma linha esteja preenchida por um jogador
      se(tabuleiro[i][0] == simboloJogadorAtual e tabuleiro[i][1] == simboloJogadorAtual e tabuleiro[i][2] == simboloJogadorAtual){
        escreva("Jogador " + nomeJogadorAtual + " venceu a partida!\n")
        computaVitoria()
        partidaEmAndamento = falso
        retorne
      } senao
      //caso em que uma coluna esteja preenchida por um jogador
      se(tabuleiro[0][i] ==  simboloJogadorAtual e tabuleiro[1][i] == simboloJogadorAtual e tabuleiro[2][i] == simboloJogadorAtual){
        escreva("Jogador " + nomeJogadorAtual + " venceu a partida!\n")
        computaVitoria()
        partidaEmAndamento = falso
        retorne
      } senao
      //caso em que a diagonal principal esteja preenchida por um jogador
      se(tabuleiro[0][0] == simboloJogadorAtual e tabuleiro[1][1] == simboloJogadorAtual e tabuleiro[2][2] == simboloJogadorAtual){
        escreva("Jogador " + nomeJogadorAtual + " venceu a partida!\n")
        computaVitoria()
        partidaEmAndamento = falso
        retorne
      } senao
      //caso em que a diagonal secundaria esteja preenchida por um jogador
      se(tabuleiro[0][2] == simboloJogadorAtual e  tabuleiro[1][1] == simboloJogadorAtual e tabuleiro[2][0] == simboloJogadorAtual){
        escreva("Jogador " + nomeJogadorAtual + " venceu a partida!\n")
        computaVitoria()
        partidaEmAndamento = falso
        retorne
      }
    }

    //verifica se existem casas vazias
    para(inteiro i = 0; i < 3; i++){
      para(inteiro j = 0; j < 3; j++){
        se(tabuleiro[i][j] == ' '){
          rodadaAtual++
          retorne
        }
      }
    }

    escreva("Jogo terminou em empate!\n")
    partidaEmAndamento = falso
    retorne
  }
}