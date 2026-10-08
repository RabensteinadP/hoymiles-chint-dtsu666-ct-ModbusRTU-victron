# Hoymiles-Chint DTSU666-CT Modbus-RTU zu Victron d-Bus Emulator (v1.0)


Dieses Projekt emuliert den modifizierten **Chint DTSU666-CT Smart Meter (Hoymiles-Edition)** als vollwertiges Grid-Meter (**com.victronenergy.grid**) im Victron Venus OS (Cerbo GX / Raspberry Pi). 

Es wurde speziell für Systeme entwickelt um absolut Korrekte Werte im VenusOS zu haben. Nur Bei 2 Blind oder Scheinenergiewerten kvar bin ich noch unsicher. Da ich mehrere Miniservices betreibe die noch nicht reif für hier sind ist das hier mal das erste!

## 🎯 Projekt-Historie & Urheberhinweis
Alle Erkenntnisse, die Entschlüsselung der Register-Matrix und der Code wurden durch eine enge Zusammenarbeit von **Klaus Reitbauer** und einer KI (**Google Gemini**) ausgearbeitet. Da ich (Klaus Reitbauer) kein gelernter Programmierer bin, habe ich diese Hilfe in Anspruch genommen. Die Logik wurde von mir physisch am System geprüft.
Ich habe mir größte Mühe gegeben ein Industrial-embeddet-coding zu forcieren und glaube einiges erreiht zu haben.

Da ich keine tiefen drehstrom-elektrotechnischen Kenntnisse besitze, bleiben letzte Unsicherheiten bestehen. (Blind und Scheinenergie etwa) 
* Die Phasenwinkelangaben bilden sich aus dem reinen Winkelversatz von Strom und Spannung (voreilend/nacheilend) und *nicht* aus dem 120°-Versatz der Phasenspannungen!
* Der Hoymiles-Chint DTSU666-CT ist ein 4-Quadranten-Zähler. Hoymiles fordert, dass die CT-Klemmen Richtung Netz zeigen. Wir drehen das im Code per Software um, damit ein für Menschen (und Victron) gewohnter Hauszähler angezeigt wird.

**KEIN GEWÄHR AUF ABSOLUTE KORREKTHEIT! VERWENDUNG AUF EIGENE GEFAHR!**

---

## 🛠️ Features des Releases
Exklusivbetrieb zwischen hoymiles-Chint DTSU666Ct und einem RS485-USB Adapter (isolated DSD-Tech SH-U11F isole in meinem Fall! (isoliert würde ich echt empfehlen!)
* **Updatesicherer Betrieb:** Vollständige Integration in `/data/rcS.local` und `/data/rc.local`auf Wunsch hin.
* **Exklusiver udev-Schutzschild:** Schützt das USB-RS485-Kabel vor asynchronen Zugriffen durch den Victron-Hintergrundscanner (`vedirect-dbus`). 
* **Zentraler Installer:** Ein interaktives 3-Schritt-Setup leitet dich durch die Pfad-Validierung, die automatische Hardware-Erkennung und die Daemontools-Dienst-Zündung.
* **PID-Wächter & Notbremse:** Das Setup prüft die Stabilität der Prozess-ID (PID) nach dem Start dreimal im 2s-Takt. Bei Instabilität greift die automatische Notbremse (`svc -d`), um dein System vor Crash-Loops zu schützen.

---

## 📦 Kinderleichte Installation

Kopiere die beiden Dateien `hoymiles_chint_emulator.tar.gz` und `install.sh` per WinSCP/FileZilla auf deinen Cerbo GX (z. B. nach `/data/tmp/`). 

Führe danach auf deiner SSH-Konsole einfach diese beiden Befehle aus:

```bash
# 1. Rechte für den Installer freigeben
chmod 755 install.sh

# 2. Den automatischen Installer zünden
./install.sh
```
Der Installer entpackt das Framework exakt nach Systemdoktrine, springt in die Setup-Tools und startet die interaktive Maske.

## 📄 Lizenz
Dieses Projekt ist unter der **GNU General Public License v3** lizenziert. Jede Weiterentwicklung der Community muss quelloffen bleiben und dieses Projekt in den Credits erwähnen.
Eine Namensnennung "Klaus Reitbauer" wäre mindestens nett von euch! Aber ich habe meist mit hilfe der google gemini KI gearbeitet und deshalb gebe ich das auch so an.
