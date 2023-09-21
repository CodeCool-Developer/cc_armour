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

Config = {}

Config.Framework = function()
    return exports['es_extended']:getSharedObject()
end

Config.EventRoute = {
    ['getSkin'] = 'skinchanger:getSkin',                -- Default: 'skinchanger:getSkin'
    ['loadClothes'] = 'skinchanger:loadClothes',        -- Default: 'skinchanger:loadClothes'
}

Config.Debug = true                                     -- Debug Mode (true: แสดง log | false: ไม่แสดง log)

Config.ClientUseItem = true                             -- เปิดใช้งานกดใช้ไอเทม C > C ไม่ผ่าน Server (true: เปิด | false: เปิด) *** จำเป็นต้องนำ export ไปเชื่อมกับกระเป๋า
--- วิธีเชื่อมกับกระเป๋า NC เพื่อใช้งานการกดใช้ไอเทมแบบ Client > Client เพื่อลด delay
--- ไปที่ Config.ClientWillUseItem ในไฟล์ config.functions.client.lua (ของ nc_inventory)
--- แล้วนำ exports.cc_armour:OnUseItem(itemName) ไปใส่
--- ตัวอย่าง
--[[
Config.ClientWillUseItem = function(itemName, itemType, shortcut)
    Citizen.CreateThread(function()
        if itemType == 'item' then
            pcall(function()
                exports.cc_armour:OnUseItem(itemName)
            end)
        end
    end)
    return true
end
]]--

Config.Animation = {                                    -- Custom Animation ขณะเสื้อเสื้อเกราะ
    Dict = 'clothingtie',
    Name = 'try_tie_negative_a'
}

Config.ItemUse = {
    {
        ItemName = 'bandage',                           -- ชื่อไอเทมกดใช้งาน
        ItemCount = 1,                                  -- จำนวนไอเทมที่ต้องใช้
        ArmourHealth = 100,                             -- ค่าเกราะที่ต้องการให้เพิ่มหลังใช้งาน
        AnimDuration = 3000,                            -- เวลาในการทำ Animation สวมเสื้อเกราะ
        LoadingLabel = 'กำลังสวมเกราะน้า',                 -- ข้อความหลอดโหลดขณะกำลังสวมเสื้อเกราะ
        Jobs = {
            type = 'blacklist',                         -- ชนิดของ List ที่ต้องการ (whitelist|blacklist)
            list = {
                ['ambulance']   = true,
                ['police']      = true,
            }
        },
        Uniforms = {                                    -- ปรับ Skin เสื้อเกราะ
            enable = true,                              -- Skin เสื้อเกราะ
            default = {                                 -- ชุดเกราะเริ่มต้น กรณีที่ไม่พบ job ของผู้เล่นใน config jobs ด้านล่าง
                male = {
                    Bproof_1 = 4, --เสื้อเกราะ
                    Bproof_2 = 0, --สีเสื้อเกราะ
                },
                female = {
                    Bproof_1 = 4, --เสื้อเกราะ
                    Bproof_2 = 0, --สีเสื้อเกราะ
                }
            },
            jobs = {
                ['gang_1'] = {
                    male = {
                        Bproof_1 = 4, --เสื้อเกราะ
                        Bproof_2 = 0, --สีเสื้อเกราะ
                    },
                    female = {
                        Bproof_1 = 4, --เสื้อเกราะ
                        Bproof_2 = 0, --สีเสื้อเกราะ
                    }
                },
                ['gang_2'] = {
                    male = {
                        Bproof_1 = 4, --เสื้อเกราะ
                        Bproof_2 = 0, --สีเสื้อเกราะ
                    },
                    female = {
                        Bproof_1 = 4, --เสื้อเกราะ
                        Bproof_2 = 0, --สีเสื้อเกราะ
                    }
                }
            },
        }
    },
}
