#!/usr/bin/env bash
# ============================================================
# generate_threat_spawn.sh
# Regenerates functions/threat_spawn.mcfunction
#
# Usage:
#   bash generate_threat_spawn.sh
#
# Edit the CONFIGURATION section below to change which mobs
# spawn, where they spawn, and what names they can have.
# Never edit threat_spawn.mcfunction directly — your changes
# will be overwritten next run.
# ============================================================

# ============================================================
# CONFIGURATION — edit these values
# ============================================================

# Cooldown in seconds before mobs can spawn again after a wave
COOLDOWN=300

# Mobs to spawn — format: "entity_type:x_offset:y_offset:z_offset:give_helmet"
#
#   entity_type  — any valid Bedrock entity ID
#   x/y/z_offset — blocks relative to the player (negatives ok, 0 = same as player)
#   give_helmet  — true = equip iron helmet on spawn (protects from sunlight)
#                  false = spawn as-is
#
# Common entity IDs:
#   vindicator, stray, zombie, skeleton, warden, pillager,
#   witch, blaze, creeper, spider, cave_spider, phantom
#
# To change to a warden, for example:
#   Replace "vindicator:4:1:0:false" with "warden:4:1:0:false"
#
MOBS=(
    "vindicator:4:1:0:false"
    "vindicator:-4:1:0:false"
    "stray:0:1:4:true"
    "stray:0:1:-4:true"
)

# Shared name pool — all mobs in every wave draw from this list
# Each mob in a wave gets the next name in sequence so no two
# mobs in the same wave share a name
#
# To add a name: add a new quoted entry to the list
# Names cycle back to the start when the end is reached
#
NAMES=(
    "Viktor"
    "Grim"
    "Malgore"
    "Shard"
    "Dredge"
    "Vex"
    "Ruin"
    "Thresh"
    "Frostbite"
    "Sleet"
    "Rime"
    "Hail"
    "Blizzard"
    "Tundra"
    "Glacier"
    "Chill"
)

# ============================================================
# SCRIPT — do not edit below this line
# ============================================================

OUTPUT="functions/threat_spawn.mcfunction"
NAME_COUNT=${#NAMES[@]}
MOB_COUNT=${#MOBS[@]}

# Format a numeric offset as a relative coordinate (~4, ~-4, ~)
format_coord() {
    local val=$1
    if [ "$val" -eq 0 ]; then
        echo "~"
    else
        echo "~$val"
    fi
}

# Collect entity types that need helmets (deduplicated)
declare -A HELMET_TYPES
for mob_entry in "${MOBS[@]}"; do
    IFS=':' read -r entity x y z helmet <<< "$mob_entry"
    if [ "$helmet" = "true" ]; then
        HELMET_TYPES["$entity"]=1
    fi
done

# ---- File header ----
cat > "$OUTPUT" << HEADER
# ============================================================
# threat_spawn.mcfunction
# AUTO-GENERATED — do not edit manually.
# Run generate_threat_spawn.sh to regenerate.
# ============================================================
# Called when a player's threat score hits the threshold.
# Named mobs do not despawn.
#
# Mobs in this wave: $MOB_COUNT
# Name pool size:    $NAME_COUNT
# Spawn cooldown:    ${COOLDOWN}s

# ===== Set ${COOLDOWN}-second cooldown =====
scoreboard players set @s spawn_cooldown $COOLDOWN

HEADER

# ---- Tag pre-existing mobs that need helmets ----
if [ ${#HELMET_TYPES[@]} -gt 0 ]; then
    echo "# ===== Tag pre-existing mobs so helmets only go to newly spawned ones =====" >> "$OUTPUT"
    for entity in "${!HELMET_TYPES[@]}"; do
        echo "tag @e[type=$entity] add threat_pre_existing" >> "$OUTPUT"
    done
    echo "" >> "$OUTPUT"
fi

# ---- Spawn each mob with a cycling name ----
cat >> "$OUTPUT" << 'SECTION'
# ===========================================================
# MOB SPAWNS
# mob_name_idx cycles through the name pool each spawn
# ===========================================================
SECTION

for mob_entry in "${MOBS[@]}"; do
    IFS=':' read -r entity x y z helmet <<< "$mob_entry"

    cx=$(format_coord "$x")
    cy=$(format_coord "$y")
    cz=$(format_coord "$z")

    {
        echo ""
        echo "# --- $entity at $cx $cy $cz ---"
        echo "scoreboard players add SYSTEM mob_name_idx 1"
        echo "execute if score SYSTEM mob_name_idx matches ${NAME_COUNT}.. run scoreboard players set SYSTEM mob_name_idx 0"
        echo ""
        for (( i=0; i<NAME_COUNT; i++ )); do
            echo "execute if score SYSTEM mob_name_idx matches $i run summon $entity \"${NAMES[$i]}\" $cx $cy $cz"
        done
    } >> "$OUTPUT"
done

# ---- Helmets for newly spawned mobs ----
if [ ${#HELMET_TYPES[@]} -gt 0 ]; then
    {
        echo ""
        echo "# ===== Give helmets to newly spawned mobs only ====="
        for entity in "${!HELMET_TYPES[@]}"; do
            echo "replaceitem entity @e[type=$entity,tag=!threat_pre_existing] slot.armor.head 0 iron_helmet"
        done
        echo ""
        echo "# ===== Clean up tags ====="
        for entity in "${!HELMET_TYPES[@]}"; do
            echo "tag @e[type=$entity] remove threat_pre_existing"
        done
        echo ""
    } >> "$OUTPUT"
fi

echo "Generated $OUTPUT"
echo "  Mobs:     $MOB_COUNT"
echo "  Names:    $NAME_COUNT"
echo "  Cooldown: ${COOLDOWN}s"
