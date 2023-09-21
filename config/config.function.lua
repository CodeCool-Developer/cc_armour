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

---------------------------------------------------
------------------- Client Side -------------------
---------------------------------------------------

--- ไม่แนะนำให้ใช้ script หลอดโหลดซ้ำกันกับตอนใช้ไอเทมชนิดชุบผู้เล่นหรือ AED
Config.CustomProgressbarOnUseItem = function(item)
    ---ตัวอย่างการใช้ script progressBars ทำหลอดโหลด
    exports['progressBars']:startUI(item.AnimDuration, item.LoadingLabel)

    ---ตัวอย่างการใช้ script nc_notify ทำหลอดโหลด
    --exports.nc_notify:PushNotification({
    --    title = item.LoadingLabel,
    --    position = 'bottom',
    --    direction = 'center',
    --    type = 'info',
    --    duration = item.Duration
    --})
end
