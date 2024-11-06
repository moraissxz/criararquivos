#!/bin/bash

verificar_arquivo() {
    if [ -e "$1" ]; then
        echo "O arquivo '$1' já existe."
        echo "Deseja sobrescrever (sim/não)?"
        read resposta
        if [ "$resposta" == "sim" ]; then
            return 0  
        elif [ "$resposta" == "não" ]; then
            echo "Digite um novo nome para o arquivo:"
            read novo_nome
            verificar_arquivo "$novo_nome"
        else
            echo "Opção inválida. Saindo."
            exit 1
        fi
    else
        return 1 
    fi
}

echo "Digite o nome do arquivo (inclua a extensão, ex: texto.txt):"
read nome_arquivo

verificar_arquivo "$nome_arquivo"

echo "Digite o conteúdo que deseja salvar no arquivo:"
read conteudo

echo "$conteudo" > "$nome_arquivo"

echo "O arquivo '$nome_arquivo' foi criado com sucesso!"

