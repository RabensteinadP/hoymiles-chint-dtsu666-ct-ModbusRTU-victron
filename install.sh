#!/bin/sh
# -*- coding: utf-8 -*-
# ===============================================================================
# Copyright (c) 2026 Einstein-Project
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
# ===============================================================================
# 🎯 INSTALLATIONSSKRIPT FÜR DEN HOYMILES-CHINT EMULATOR
# Entwickelt von Klaus Reitbauer & Google-Gemini
# ===============================================================================

# Bildschirm aufräumen für eine saubere Maske
clear

echo "=================================================="
echo "📊 CHINT-EMULATOR - AUTOMATISCHER RELEASER-INSTALLER"
echo "=================================================="
echo "Dieses Skript entpackt die Chint-Hoymiles-Infrastruktur"
echo "updatesicher und exakt nach den Vorgaben der Systemdoktrine."
echo "--------------------------------------------------"

ARCHIV_NAME="hoymiles_chint_emulator.tar.gz"
ZIEL_PFAD="/data/etc/victron-device-emulators/02_device_emulators"
SETUP_DIR="/data/etc/victron-device-emulators/02_device_emulators/counter/setup_tools"

# 1. Sicherheitsprüfung: Existiert das Archiv im aktuellen Verzeichnis?
if [ ! -f "$ARCHIV_NAME" ]; then
    echo "[🚨] KRITISCHER FEHLER: Die Datei '$ARCHIV_NAME' wurde nicht gefunden!"
    echo "    Bitte stelle sicher, dass 'install.sh' und '$ARCHIV_NAME'"
    echo "    im selben Ordner liegen."
    echo "=================================================="
    exit 1
fi

# 2. Zielverzeichnis erzwingen (erstellt die tiefe Hierarchie falls beim User neu)
echo "[⚙️] Bereite Ziel-Verzeichnisstruktur vor..."
mkdir -p "$ZIEL_PFAD"

# 3. Entpacken mit absolutem Pfad-Schutzwurf
echo "[📦] Entpacke System-Komponenten auf den Ziel-Pfad..."
tar -xzf "$ARCHIV_NAME" -C "$ZIEL_PFAD/"

if [ $? -eq 0 ]; then
    echo "[✓] Archiv erfolgreich und fehlerfrei entpackt."
else
    echo "[!] FEHLER beim Entpacken des Archivs!"
    exit 1
fi

echo "--------------------------------------------------"
echo "[⏳] Bereite Übergang zur interaktiven Konfiguration vor..."
sleep 2

# 4. In das tiefe setup_tools Verzeichnis springen und den Installer zünden
if [ -d "$SETUP_DIR" ]; then
    clear
    cd "$SETUP_DIR"
    echo "[➔] Wechsel in das Setup-Verzeichnis erfolgreich."
    echo "[⚡] Starte das interaktive Framework-Setup (setup.py)..."
    echo "=================================================="
    exec ./setup.py
else
    echo "[🚨] FEHLER: Setup-Verzeichnis '$SETUP_DIR' nicht auffindbar!"
    exit 1
fi
