# ipchanger    

change settings of Ethernet card from windows CLI 

PL:
Prosty skrypt do zmiany adresu IP z windowsowego CMD
skrypt musi byc uruchomiony jako Admin z racji tego,że korzystamy z polsecenia "netsh"

mamy obecnie dwa presety do ustawienia karty sieciowej:
192.168.0.XXX
oraz
192.168.1.XXX
dodatkowo mamy opcje przełaczenia karty na "DHCP"
oraz wklepania swoich wartosic recznie.

WAŻNE :
w presetach nasz adres bedzie wynosil zawsze 200 (ex. 192.168.0.254)
maska jest ustawiona na 255.255.255.0 -gdyby byla potrzeba mozna dokleic jedna linijke kodu zeby wpisywac to recznie (dla mnie to zbedne)


EN:
Simple script to change settings of Ethernet card from windows CMD
you must run it as Administrator (we using netsh here -requies admin privs ;/ )
it has two presets: 
192.168.0.XXX
and
192.168.1.XXX
and of course you can set your values manually or return to DHCP 

netmask is: 255.255.255.0
and preset IP addr is always .254 (ex. 192.168.0.254)

enjoy !
.
