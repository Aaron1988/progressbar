local progress = {}

function progress.start(text, duration, cb)
    SendNUIMessage({
        type = "progress",
        text = text,
        duration = duration
    })

    Citizen.CreateThread(function()
        Citizen.Wait(duration)
        SendNUIMessage({type = "stop"})
        if cb then cb() end
    end)
end

RegisterNetEvent('progress:start')
AddEventHandler('progress:start', function(text, duration, cb)
    progress.start(text, duration, cb)
end)

-- Esempio di utilizzo
RegisterCommand('testbarr', function()
    exports['progressbar']:start("Esempio di progressbar", 5000, function()
        print("Progressbar completata!")
    end)
end)