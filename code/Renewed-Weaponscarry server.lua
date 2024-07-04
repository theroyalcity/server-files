-- intiate the statebag for the player
AddEventHandler('Renewed-Lib:server:playerRemoved', function(source)
    local playerState = Player(source).state

    playerState:set(
