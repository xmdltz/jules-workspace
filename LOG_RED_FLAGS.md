# Röda flaggor i systemloggar vid Baseband-attacker

Att identifiera en attack mot radioprocessorn (modemet) via Android-loggar kräver att man letar efter anomalier i kommunikationen mellan Application Processor (AP) och Baseband Processor (BP).

### 1. Plötsliga Radio-resetar (Silent Reboots)
- **Logcat-tecken:** `RIL` (Radio Interface Layer) rapporterar oväntade omstarter utan att användaren har bytt läge.
- **Exempel:** `RILC: RIL_Request: [Serial No] RIL_REQUEST_RADIO_POWER` (när det inte förväntas).

### 2. Ovanliga protokollfel (RRC/NAS)
- **Logcat-tecken:** Loggar som indikerar att modemet har tagit emot "malformed packets" eller ogiltiga instruktioner från basstationen.
- **Röd flagga:** `Modem: Invalid NAS message received` eller upprepade `Reject Cause` koder som inte stämmer överens med nätverksmiljön.

### 3. Nedgraderingsattacker (2G/GSM)
- **Logcat-tecken:** Telefonen tvingas ner till 2G (GSM) trots bra 4G/5G-täckning. 2G saknar ofta ömsesidig autentisering, vilket gör det lättare att utföra MITM-attacker via falska basstationer (IMSI catchers).
- **Röd flagga:** `ConnectivityService: Network Monitor: 4G -> 2G fallback detected`.

### 4. Avvikande "Timing Advance" eller Signalstyrka
- **Logcat-tecken:** Plötsliga och orimliga hopp i signalstyrka eller avståndsinformation (Timing Advance) till basstationen.
- **Röd flagga:** Indikerar att en falsk basstation befinner sig mycket nära enheten.
