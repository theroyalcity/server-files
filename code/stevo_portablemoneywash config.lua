return {

    dropCheaters = false, -- If cheaters should be kicked.
    dirtyMoneyItem = 'black_money',
    moneyItem = 'money',
    useSlider = true, -- if slider or number input should be used for inputting wash amount
    sliderStep = 10, -- Amount slider should jump up in
    loadTime = 3, -- Time in seconds to load machine
    progressCircle = false, -- If lib progressCircle should be used instead of progressBar


    washingMachines = {
        ['oldmoneywash'] = { -- TableType, use the name of the table item           
            model = 'prop_washer_01',
            label = 'T100 Washer',
            msecPer = 100, -- Milliseconds per 1 dirty/black money washed (1000 msec = 1 second)
            washTax = 0.15, -- Tax percentage (0.15 = 15% of wash amount will be taxed)
        },
        
        ['deluxemoneywash'] = { -- TableType, use the name of the table item      
            model = 'prop_washer_02',
            label = 'T2000 Washer',
            msecPer = 50, -- Milliseconds per 1 dirty/black money washed (1000 msec = 1 second)
            washTax = 0.05, -- Tax percentage (0.05 = 5% of wash amount will be taxed)
        }
    },

    target = { 
        radius = vec3(1, 1, 1), -- Radius that is targetable
        icon = 'fas fa-soap', -- https://fontawesome.com/icons
        distance = 2.0, -- Distance can be targeted from
    },
    
}
