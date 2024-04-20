local progress = {}

-- Funzione per iniziare la progress bar
function progress.start(text, duration, cb)
    -- Invia prima il messaggio di reset
    SendNUIMessage({type = "reset"})
    Citizen.Wait(100)  -- Aspetta un po' per il reset visivo completo

    -- Poi invia il messaggio di start
    SendNUIMessage({
        type = "progress",
        text = text,
        duration = duration
    })

    -- Crea un thread che aspetta la durata specificata prima di fermare la progress bar
    Citizen.CreateThread(function()
        Citizen.Wait(duration)
        SendNUIMessage({type = "stop"})
        if cb then cb() end  -- Chiama la callback, se fornita
    end)
end

-- Comando 'testbarr' per testare la prima progress bar
RegisterCommand('testbarr', function()
    progress.start("Esempio di progressbar 1", 5000, function()
        print("Progressbar 1 completata!")
    end)
end)

-- Comando 'testbarr2' per testare due progress bar consecutive
RegisterCommand('testbarr2', function()
    progress.start("Esempio di progressbar 1", 5000, function()
        print("Progressbar 1 completata! Inizio progressbar 2...")
        -- Aspetta un breve periodo prima di iniziare la seconda progress bar
        Citizen.Wait(200)
        progress.start("Esempio di progressbar 2", 3000, function()
            print("Progressbar 2 completata!")
        end)
    end)
end)
