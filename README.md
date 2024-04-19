Per utilizzare la progressbar in altre risorse, segui questi passaggi:

Assicurati che la risorsa progressbar sia avviata sul server FiveM e che sia elencata nella configurazione del server prima delle risorse che la utilizzano.

Nella risorsa in cui desideri utilizzare la progressbar, aggiungi la seguente riga di codice nel file fxmanifest.lua o __resource.lua:
client_script '@progressbar/client.lua'

Nel file client della tua risorsa (ad esempio, client.lua), puoi avviare la progressbar utilizzando il seguente codice:
exports['progressbar']:start(text, duration, callback)
text (string): Il testo da visualizzare nella progressbar.
duration (number): La durata della progressbar in millisecondi.
callback (function, opzionale): Una funzione da eseguire al completamento della progressbar.

Esempio di utilizzo:
exports['progressbar']:start("Esempio di progressbar", 5000, function()
    print("Progressbar completata!")
end)

Se desideri avviare la progressbar da un evento di rete, puoi utilizzare il seguente codice nel file server della tua risorsa:
TriggerClientEvent('progress:start', playerId, text, duration, callback)
playerId (string o number): L'ID del giocatore a cui inviare l'evento. Utilizza source per inviarlo al giocatore che ha attivato l'evento.
text, duration e callback sono gli stessi parametri descritti in precedenza.

Esempio di utilizzo in un evento di rete:
RegisterServerEvent('esempio:evento')
AddEventHandler('esempio:evento', function()
    local playerId = source
    TriggerClientEvent('progress:start', playerId, "Esempio di progressbar", 5000, function()
        print("Progressbar completata per il giocatore " .. playerId)
    end)
end)

Ricorda di gestire eventuali situazioni in cui la progressbar potrebbe essere interrotta, ad esempio quando un giocatore si disconnette o muore. Puoi utilizzare gli eventi di rete appropriati per interrompere la progressbar in tali situazioni.
Con questi passaggi, sarai in grado di utilizzare la progressbar in altre risorse del tuo server FiveM. Assicurati di adattare il codice alle tue esigenze specifiche e di testare accuratamente l'integrazione con le altre risorse.
