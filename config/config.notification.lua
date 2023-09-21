---   ██████╗   ██████╗    ██████╗  ██████╗ ██╗  ██╗ ██████╗ ██╗     █████╗  ██████╗  ██████╗ ██████╗    ██╗ --
--- ██╔═════╝ ██╔═════╝    ██╔══██╗ ██╔═══╝ ██║  ██║ ██╔═══╝ ██║    ██╔══██╗ ██╔══██╗ ██╔═══╝ ██╔══██╗   ██║ --
--- ██║       ██║          ██║  ██║ █████╗  ██║  ██║ █████╗  ██║    ██║  ██║ ██████╔╝ █████╗  ██████╔╝   ██║ --
--- ██║       ██║          ██║  ██║ ██╔══╝  ╚██╗██╔╝ ██╔══╝  ██║    ██║  ██║ ██╔═══╝  ██╔══╝  ██╔══██╗   ╚═╝ --
--- ╚═██████╗ ╚═██████╗    ██████╔╝ ██████╗  ╚███╔╝  ██████╗ ██████╗╚█████╔╝ ██║      ██████╗ ██║  ██║   ██╗ --
---   ╚═════╝   ╚═════╝    ╚═════╝  ╚═════╝   ╚══╝   ╚═════╝ ╚═════╝ ╚════╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝ --
--- Project : CC Premium Armour Suit
--- Auth : CodeCool Developer
--- Discord : https://discord.gg/K7PDe2jfpW
--- Website : https://fivem.cc-developer.com

-----------------------------------------------
----------------- Client Side -----------------
-----------------------------------------------
--- text = ข้อความแจ้งเตือน
--- type = ประเภทแจ้งเตือน
--- duration = เวลาแสดงแจ้งเตือน
Config.ClientOnNotify = function(type, duration, message, description)
    exports.nc_notify:PushNotification({
        title = message,
        position = 'top',
        direction = 'right',
        description = description,
        type = type,
        duration = duration
    })
end

-----------------------------------------------
----------------- Server Side -----------------
-----------------------------------------------
--- text = ข้อความแจ้งเตือน
--- type = ประเภทแจ้งเตือน
--- duration = เวลาแสดงแจ้งเตือน
Config.ServerOnNotify = function(xPlayer, type, duration, message, description)
    exports.nc_notify:PushNotification(xPlayer.source, {
        title = message,
        position = 'top',
        direction = 'right',
        description = description,
        type = type,
        duration = duration
    })
end
