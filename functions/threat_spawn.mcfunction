# ============================================================
# threat_spawn.mcfunction
# AUTO-GENERATED — do not edit manually.
# Run generate_threat_spawn.sh to regenerate.
# ============================================================
# Called when a player's threat score hits the threshold.
# Named mobs do not despawn.
#
# Mobs in this wave: 4
# Name pool size:    16
# Spawn cooldown:    300s

# ===== Set 300-second cooldown =====
scoreboard players set @s spawn_cooldown 300

# ===== Tag pre-existing mobs so helmets only go to newly spawned ones =====
tag @e[type=stray] add threat_pre_existing

# ===========================================================
# MOB SPAWNS
# mob_name_idx cycles through the name pool each spawn
# ===========================================================

# --- vindicator at ~4 ~1 ~ ---
scoreboard players add SYSTEM mob_name_idx 1
execute if score SYSTEM mob_name_idx matches 16.. run scoreboard players set SYSTEM mob_name_idx 0

execute if score SYSTEM mob_name_idx matches 0 run summon vindicator "Viktor" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 1 run summon vindicator "Grim" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 2 run summon vindicator "Malgore" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 3 run summon vindicator "Shard" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 4 run summon vindicator "Dredge" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 5 run summon vindicator "Vex" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 6 run summon vindicator "Ruin" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 7 run summon vindicator "Thresh" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 8 run summon vindicator "Frostbite" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 9 run summon vindicator "Sleet" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 10 run summon vindicator "Rime" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 11 run summon vindicator "Hail" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 12 run summon vindicator "Blizzard" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 13 run summon vindicator "Tundra" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 14 run summon vindicator "Glacier" ~4 ~1 ~
execute if score SYSTEM mob_name_idx matches 15 run summon vindicator "Chill" ~4 ~1 ~

# --- vindicator at ~-4 ~1 ~ ---
scoreboard players add SYSTEM mob_name_idx 1
execute if score SYSTEM mob_name_idx matches 16.. run scoreboard players set SYSTEM mob_name_idx 0

execute if score SYSTEM mob_name_idx matches 0 run summon vindicator "Viktor" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 1 run summon vindicator "Grim" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 2 run summon vindicator "Malgore" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 3 run summon vindicator "Shard" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 4 run summon vindicator "Dredge" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 5 run summon vindicator "Vex" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 6 run summon vindicator "Ruin" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 7 run summon vindicator "Thresh" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 8 run summon vindicator "Frostbite" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 9 run summon vindicator "Sleet" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 10 run summon vindicator "Rime" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 11 run summon vindicator "Hail" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 12 run summon vindicator "Blizzard" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 13 run summon vindicator "Tundra" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 14 run summon vindicator "Glacier" ~-4 ~1 ~
execute if score SYSTEM mob_name_idx matches 15 run summon vindicator "Chill" ~-4 ~1 ~

# --- stray at ~ ~1 ~4 ---
scoreboard players add SYSTEM mob_name_idx 1
execute if score SYSTEM mob_name_idx matches 16.. run scoreboard players set SYSTEM mob_name_idx 0

execute if score SYSTEM mob_name_idx matches 0 run summon stray "Viktor" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 1 run summon stray "Grim" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 2 run summon stray "Malgore" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 3 run summon stray "Shard" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 4 run summon stray "Dredge" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 5 run summon stray "Vex" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 6 run summon stray "Ruin" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 7 run summon stray "Thresh" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 8 run summon stray "Frostbite" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 9 run summon stray "Sleet" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 10 run summon stray "Rime" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 11 run summon stray "Hail" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 12 run summon stray "Blizzard" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 13 run summon stray "Tundra" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 14 run summon stray "Glacier" ~ ~1 ~4
execute if score SYSTEM mob_name_idx matches 15 run summon stray "Chill" ~ ~1 ~4

# --- stray at ~ ~1 ~-4 ---
scoreboard players add SYSTEM mob_name_idx 1
execute if score SYSTEM mob_name_idx matches 16.. run scoreboard players set SYSTEM mob_name_idx 0

execute if score SYSTEM mob_name_idx matches 0 run summon stray "Viktor" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 1 run summon stray "Grim" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 2 run summon stray "Malgore" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 3 run summon stray "Shard" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 4 run summon stray "Dredge" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 5 run summon stray "Vex" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 6 run summon stray "Ruin" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 7 run summon stray "Thresh" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 8 run summon stray "Frostbite" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 9 run summon stray "Sleet" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 10 run summon stray "Rime" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 11 run summon stray "Hail" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 12 run summon stray "Blizzard" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 13 run summon stray "Tundra" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 14 run summon stray "Glacier" ~ ~1 ~-4
execute if score SYSTEM mob_name_idx matches 15 run summon stray "Chill" ~ ~1 ~-4

# ===== Give helmets to newly spawned mobs only =====
replaceitem entity @e[type=stray,tag=!threat_pre_existing] slot.armor.head 0 iron_helmet

# ===== Clean up tags =====
tag @e[type=stray] remove threat_pre_existing

