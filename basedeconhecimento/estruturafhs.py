#!/usr/bin/python3

options = {
        "1": lambda : "/bin: Comandos (binários) essenciais acessíveis a qualquer usuário",
        "2": lambda :"/sbin: Comandos (binários) essenciais administrativos",
        "3": lambda :"/boot: Arquivos estáticos do gerenciador de inicialização e imagem do Kernel",
        "4": lambda :"/dev: Arquivos dispositivos (Hds, placa de som, placa de vídeo, mouse, etc, exceto placa de rede)",
        "5": lambda : "/etc: Arquivos de configuração de sistema e de programas em geral",
        "6": lambda : "/lib: Bibliotecas essenciais do sistema",
        "7": lambda : "/media: Ponto de montagem para dispositivos removíveis",
        "8": lambda :  "/mnt: Ponto de montagem para sistemas de arquivos temporários",
        "9": lambda : "/opt: Pacotes de software adicionais (proprietários)",
        "10": lambda : "/srv: Dados providos por serviços de rede do sistema",
        "11": lambda : "/var: Dados variáveis (por exemplo: arquivos de log, cache, spool de impressão etc)",
        "12": lambda : "/home: Diretórios pessoais dos usuários",
        "13": lambda : "/root: Diretório pessoal do root",
        "14": lambda : "/usr: Hierarquia secundária. É chamado de hierárquia secundária pois é o maior diretório do sistema após o diretório raiz. Todos os subdiretórios em /usr não são essenciais e tem uma estrutura muito parecida com / do sistema",
        "15": lambda : "/usr/sbin: Binários administrativos não essenciais",
        "16": lambda : "/usr/bin: Binários não essenciais",
        "17": lambda : "/usr/lib: Bibliotecas não essenciais ao sistema",
        "18": lambda : "/proc: Armazena informações dinâmicas sobre o sistema operacional, como, processos, informações sobre entrada e saída, interrupções, modelo do processador, versão do kernel, quanto tempo a máquina está ligada, quais sistemas de arquivos suportados etc. Este diretório não existe no disco rígido e sim na memória RAM",
        "19":lambda : "/tmp: Arquivos temporários que são limpos durante a inicialização",
        "20": exit

}


while True:
    print("==MENU BASH==")
    opt = input(
            f"1) /bin      2) /sbin   3) /boot       4) /dev \n"
            f"5) /etc      6) /lib    7) /media      8) /mnt \n"
            f"9) /opt      10) /srv    11) /var        12) /home \n"
            f"13) /root     14) /usr    15) /usr/sbin   16) /usr/bin\n"
            f"17) /usr/lib  18) /proc   19) /tmp        20) Sair\n"
            f"Escolha a opção desejada:\n"
    )

    if opt in options:
        print("----------------------------\n\n",
              options[opt](),
              "\n\n----------------------------\n\n")

    else:
        print("Opção inválida")
