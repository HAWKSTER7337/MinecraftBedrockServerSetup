# Called when a player's threat score hits 100
# Spawns 2 Vindicators + 2 Strays (with helmets for sun protection)
# Sets a 30-second cooldown before mobs can spawn again

# ===== Set 300-second cooldown =====
scoreboard players set @s spawn_cooldown 300

# ===== Warn the player =====
tellraw @s {"rawtext":[{"text":"§c§lYour ore haul has attracted dangerous creatures..."}]}

# ===== Spawn 2 Vindicators (always hostile to players) =====
summon vindicator ~4 ~1 ~
summon vindicator ~-4 ~1 ~

# ===== Spawn 2 Strays with helmets =====
# First tag any pre-existing strays so we only helmet the new ones
tag @e[type=stray] add pre_existing_stray

summon stray ~ ~1 ~4
summon stray ~ ~1 ~-4

# Give iron helmets only to the newly spawned strays (no pre_existing_stray tag)
replaceitem entity @e[type=stray,tag=!pre_existing_stray] slot.armor.head 0 iron_helmet

# Clean up the temporary tag
tag @e[type=stray] remove pre_existing_stray
