# M300-Services

## Persönlicher Wissensstand
Ich hatte am Anfang dieses Modules gar keine Ahnung über das Thema "Infrastructure as a code", weshalb ich am Anfang auch Probleme hatte.

### Linux
Ich kannte bereits die Basics von Linux. Sowie ich auch bereits wusste wie man eine Firewall, Webserver und weiters auf diesem Betriebssystem einrichtet. Ich bin nun an dem Linux teste LPIC-1 am lernen, was mit bei dieser Aufgabe aber leider nicht wirklich geholfen hat.

### Virtualisierung
Ich habe schon in einige Modulen Virtualisierungen erstellt. In der Firma verwende ich ebenfalls Virtualisierungen um Services zu testen, weshalb ich bei dieser Sache auch keine grosse Probleme hatte.

### Vagrant
Ich kannte Vagrant vor diesem Projekt noch gar nicht. Ich wusste aber, dass es möglich ist Virtualisiserungen automatisch zu erstellen. Es hat mich seh gefreut, dass ich nun endlich dieses Tool anschauen konnte, dass mit ermöglicht Virtualisiserungen automatishc zu erstellen.

### Versionsverwaltung/Git
ICh kannte Git vo ersten Lehrlabor, habe es aber seit dem nie wieder verwendet.

### Mark Down
Ich kannte Mark Down noch gar nicht, kannte aber die Endung .md.

### Systemsicherheit
Systemsicherheit war mir bereits vor dem Modul bekannt, da die Systemsicherheit ein sehr wichtiger Teil der Informatik ist. Zudem beinhaltet fast jedes Modul zu einem bestimmten Teil aus Systemsicherheit.

## Lernschritte
Ich konnte in diesem Modul das erste Mal Mark Down, Vagrant und Git Bash richtig kennenlernen. Ich dokumentiere in meiner Firma mit Trac, weshalb ich Mark Down ziemlich schnell verstand. Ich mochte Vagrant sehr, weshalb ich keine Proleme hat einbisschen mehr Zeit zu investieren und ich somit ziemlich schnell damit klar kam. Bei GIt BAsh lernte ich die Basic Befehle.

## Umgebung
### Testfälle
| Was getestet wurde | Soll | Ist |
| -------------------|:----:|:----|
| Vagrant ausführen  | Zwei Vms werden erstellt | Zwei VMs wurden erstellt |
| Webserver | Wenn ich die IP eingebe soll die Standart Seite kommen | Die Standart webseite kan zum hervorschein |
| Datenbank Verbindung | Man soll ein selbs gemachtes Passwort gesetzt haben | eigenes Passwort wurde erfolgreich gesetzt |
| Datenbank Tabellen | Es Webserver muss sich mit der Datenbank verbinden können und dessen Tabellen anzeigen | alles wurde richtig angezeigt


## Sicherheitsmassnahmen
### Firewall
Für die Sicherheitsmassnahme, habe ich eine Firewall mit dem Befehl "sudo apt-get install ufw" installiert, welche anschliessend aktiviert wird.

### Reverse Proxy
Zudem habe ich einen Reverse Proxy installiert mit dem Befehl "sudo apt-get install libapache2-mod-proxy-html" und "sudo apt-get install libxml2-dev". Nachdem ich das Ganze installiert habe aktivierte ich noch einpaar Apache2 Module "sudo a2enmod proxy, proxy_html, proxy_http"

### Ports
Ich habe anschiessend die Ports 22 und 3306 geöfnet. DIes machte ich mit den Befehle "sudo ufw allow from 192.168.0.100 to any port 22" und sudo ufw allow from 192.168.55.101 to any port 3306
