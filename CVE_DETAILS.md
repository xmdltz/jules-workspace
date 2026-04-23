# Detaljerad CVE-analys för Android (2024)

Här följer en teknisk genomgång av tre kritiska sårbarheter som upptäckts under det senaste året, med fokus på Kernel och TrustZone.

## 1. CVE-2024-36971 (Android Kernel RCE)
**Beskrivning:** En sårbarhet i Android-kärnans nätverkshantering som möjliggör fjärrstyrd kodexekvering (RCE) med systemrättigheter.
**Teknisk detalj:** Sårbarheten rör "use-after-free" i nätverksrutiner. Google rapporterade i augusti 2024 att det finns indikationer på att denna sårbarhet utnyttjas i begränsade, riktade attacker. Genom att manipulera nätverkspaket kan en angripare korrumpera minnet i kärnan och exekvera godtycklig kod.
**Påverkan:** Kritisk. Möjliggör full kontroll över enheten utan fysisk åtkomst.

## 2. CVE-2024-26926 (Kernel Binder EoP)
**Beskrivning:** En "Elevation of Privilege" (EoP) sårbarhet i Binder-drivrutinen, Androids primära IPC-system.
**Teknisk detalj:** Sårbarheten uppstår vid felaktig hantering av objekt-referenser inom Binder-transaktioner. En angripare med lokala rättigheter (t.ex. en infekterad app) kan utnyttja detta för att eskalera sina rättigheter till Kernel-nivå.
**Påverkan:** Hög. Det är en klassisk väg för Sandbox Escape där en begränsad process bryter sig ut och får root-åtkomst i kärnan.

## 3. CVE-2024-33044 (Qualcomm Closed-Source / TrustZone)
**Beskrivning:** En sårbarhet i Qualcomms proprietära komponenter som ofta interagerar med TrustZone/TEE.
**Teknisk detalj:** Sårbarheten klassificeras som "High severity" och rör komponenter som hanterar säkra exekveringsmiljöer. Detaljer om dessa sårbarheter är ofta begränsade pga "closed-source"-naturen, men de involverar typiskt brister i hur data valideras när den skickas från Android (Normal World) till TEE (Secure World).
**Påverkan:** Hög. Kan leda till kompromettering av kryptonycklar eller biometrisk data som lagras i TEE.
