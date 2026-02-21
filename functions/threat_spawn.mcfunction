# Called when a player's threat score hits 100
# Spawns 2 Vindicators + 2 Strays (with helmets for sun protection)
# Named mobs do not despawn
# Sets a 300-second cooldown before mobs can spawn again
#
# HOW TO ADD NAMES:
#   Vindicator names: find the VINDICATOR NAMES section below, add a new line
#   following the same pattern, then update the wrap number (matches 8..) to
#   match the new total count.
#
#   Stray names: same process in the STRAY NAMES section.
#
# Current vindicator names (8): Viktor, Grim, Malgore, Shard, Dredge, Vex, Ruin, Thresh
# Current stray names      (8): Frostbite, Sleet, Rime, Hail, Blizzard, Tundra, Glacier, Chill

# ===== Set 300-second cooldown =====
scoreboard players set @s spawn_cooldown 300

# ===== Warn the player =====
tellraw @s {"rawtext":[{"text":"§c§lYour ore haul has attracted dangerous creatures..."}]}

# ===========================================================
# VINDICATOR NAMES
# Counter cycles 0-7 and advances once per vindicator spawned
# To add a name: add a new matches line and change 8.. to 9..
# ===========================================================

# --- Vindicator 1 (north) ---
scoreboard players add SYSTEM vind_name_idx 1
execute if score SYSTEM vind_name_idx matches 8.. run scoreboard players set SYSTEM vind_name_idx 0

execute if score SYSTEM vind_name_idx matches 0 run summon vindicator "Viktor" ~4 ~1 ~
execute if score SYSTEM vind_name_idx matches 1 run summon vindicator "Grim" ~4 ~1 ~
execute if score SYSTEM vind_name_idx matches 2 run summon vindicator "Malgore" ~4 ~1 ~
execute if score SYSTEM vind_name_idx matches 3 run summon vindicator "Shard" ~4 ~1 ~
execute if score SYSTEM vind_name_idx matches 4 run summon vindicator "Dredge" ~4 ~1 ~
execute if score SYSTEM vind_name_idx matches 5 run summon vindicator "Vex" ~4 ~1 ~
execute if score SYSTEM vind_name_idx matches 6 run summon vindicator "Ruin" ~4 ~1 ~
execute if score SYSTEM vind_name_idx matches 7 run summon vindicator "Thresh" ~4 ~1 ~

# --- Vindicator 2 (south) ---
scoreboard players add SYSTEM vind_name_idx 1
execute if score SYSTEM vind_name_idx matches 8.. run scoreboard players set SYSTEM vind_name_idx 0

execute if score SYSTEM vind_name_idx matches 0 run summon vindicator "Viktor" ~-4 ~1 ~
execute if score SYSTEM vind_name_idx matches 1 run summon vindicator "Grim" ~-4 ~1 ~
execute if score SYSTEM vind_name_idx matches 2 run summon vindicator "Malgore" ~-4 ~1 ~
execute if score SYSTEM vind_name_idx matches 3 run summon vindicator "Shard" ~-4 ~1 ~
execute if score SYSTEM vind_name_idx matches 4 run summon vindicator "Dredge" ~-4 ~1 ~
execute if score SYSTEM vind_name_idx matches 5 run summon vindicator "Vex" ~-4 ~1 ~
execute if score SYSTEM vind_name_idx matches 6 run summon vindicator "Ruin" ~-4 ~1 ~
execute if score SYSTEM vind_name_idx matches 7 run summon vindicator "Thresh" ~-4 ~1 ~

# ===========================================================
# STRAY NAMES
# Counter cycles 0-7 and advances once per stray spawned
# To add a name: add a new matches line and change 8.. to 9..
# ===========================================================

# Tag pre-existing strays so we only helmet the new ones
tag @e[type=stray] add pre_existing_stray

# --- Stray 1 (east) ---
scoreboard players add SYSTEM stray_name_idx 1
execute if score SYSTEM stray_name_idx matches 8.. run scoreboard players set SYSTEM stray_name_idx 0

execute if score SYSTEM stray_name_idx matches 0 run summon stray "Frostbite" ~ ~1 ~4
execute if score SYSTEM stray_name_idx matches 1 run summon stray "Sleet" ~ ~1 ~4
execute if score SYSTEM stray_name_idx matches 2 run summon stray "Rime" ~ ~1 ~4
execute if score SYSTEM stray_name_idx matches 3 run summon stray "Hail" ~ ~1 ~4
execute if score SYSTEM stray_name_idx matches 4 run summon stray "Blizzard" ~ ~1 ~4
execute if score SYSTEM stray_name_idx matches 5 run summon stray "Tundra" ~ ~1 ~4
execute if score SYSTEM stray_name_idx matches 6 run summon stray "Glacier" ~ ~1 ~4
execute if score SYSTEM stray_name_idx matches 7 run summon stray "Chill" ~ ~1 ~4

# --- Stray 2 (west) ---
scoreboard players add SYSTEM stray_name_idx 1
execute if score SYSTEM stray_name_idx matches 8.. run scoreboard players set SYSTEM stray_name_idx 0

execute if score SYSTEM stray_name_idx matches 0 run summon stray "Frostbite" ~ ~1 ~-4
execute if score SYSTEM stray_name_idx matches 1 run summon stray "Sleet" ~ ~1 ~-4
execute if score SYSTEM stray_name_idx matches 2 run summon stray "Rime" ~ ~1 ~-4
execute if score SYSTEM stray_name_idx matches 3 run summon stray "Hail" ~ ~1 ~-4
execute if score SYSTEM stray_name_idx matches 4 run summon stray "Blizzard" ~ ~1 ~-4
execute if score SYSTEM stray_name_idx matches 5 run summon stray "Tundra" ~ ~1 ~-4
execute if score SYSTEM stray_name_idx matches 6 run summon stray "Glacier" ~ ~1 ~-4
execute if score SYSTEM stray_name_idx matches 7 run summon stray "Chill" ~ ~1 ~-4

# ===== Give helmets to new strays only =====
replaceitem entity @e[type=stray,tag=!pre_existing_stray] slot.armor.head 0 iron_helmet

# ===== Clean up tag =====
tag @e[type=stray] remove pre_existing_stray
