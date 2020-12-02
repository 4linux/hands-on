#!/bin/bash
echo "=== MENU EM BASH ==="
PS3='Por favor, escolha uma opção: '
options=("/bin" "/sbin" "/boot" "/dev" "/etc" "/lib" "/media" "/mnt"  "/opt" "/srv" "/var" "/home" "/root" "/usr" "/usr/bin" "/usr/lib" "/proc" "/tmp" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "/bin")
            echo "/bin: Comandos (binários) essenciais acessíveis a qualquer usuário"
            ;;
        "/sbin")
            echo "/sbin: Comandos (binários) essenciais administrativos"
            ;;
        "/boot")
            echo "/boot: Arquivos estáticos do gerenciador de inicialização e imagem do Kernel"
            ;;
        "/dev")
            echo "/dev: Arquivos dispositivos (Hds, placa de som, placa de vídeo, mouse, etc, exceto placa de rede)"
            ;;
        "/etc")
            echo "/etc: Arquivos de configuração de sistema e de programas em geral"
            ;;
        "/lib")
            echo "/lib: Bibliotecas essenciais do sistema"
            ;;
        "/media")
            echo "/media: Ponto de montagem para dispositivos removíveis"
            ;;
        "/mnt")
            echo "/mnt: Ponto de montagem para sistemas de arquivos temporários"
            ;;
        "/opt")
            echo "/opt: Pacotes de software adicionais (proprietários)"
            ;;
        "/srv")
            echo "/srv: Dados providos por serviços de rede do sistema"
            ;;
        "/var")
            echo "/var: Dados variáveis (por exemplo: arquivos de log, cache, spool de impressão etc)"
            ;;
        "/home")
            echo "/home: Diretórios pessoais dos usuários"
            ;;
        "/root")
            echo "/root: Diretório pessoal do root"
            ;;
        "/usr")
        echo "/usr: Hierarquia secundária. É chamado de hierárquia secundária pois é o maior diretório do sistema após o diretório raiz. Todos os subdiretórios em /usr não são essenciais e tem uma estrutura muito parecida com / do sistema"
            ;;
        "/usr/sbin")
        echo "/usr/sbin: Binários administrativos não essenciais"
            ;;
        "/usr/bin")
        echo "/usr/bin: Binários não essenciais"
                ;;
        "/usr/lib")
        echo "/usr/lib: Bibliotecas não essenciais ao sistema"
            ;;
        "/proc")
        echo "/proc: Armazena informações dinâmicas sobre o sistema operacional, como, processos, informações sobre entrada e saída, interrupções, modelo do processador, versão do kernel, quanto tempo a máquina está ligada, quais sistemas de arquivos suportados etc. Este diretório não existe no disco rígido e sim na memória RAM"
            ;;
        "/tmp")
        echo "/tmp: Arquivos temporários que são limpos durante a inicialização"
            ;;


        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
