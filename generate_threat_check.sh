#!/usr/bin/env bash
# ============================================================
# generate_threat_check.sh
# Regenerates functions/threat_check.mcfunction automatically.
#
# Usage:
#   bash generate_threat_check.sh
#
# Edit the CONFIGURATION section below to change values,
# then re-run the script. Never edit threat_check.mcfunction
# directly — your changes will be overwritten next run.
# ============================================================

# ============================================================
# CONFIGURATION — edit these values
# ============================================================

THRESHOLD=500     # Threat score needed to trigger mob spawn

# Ore entries — format: "item_id:value_per_unit:Display Label"
# Higher value = rarer ore = more threat per unit
# To add a new ore: copy a line, paste it, change the values
ORES=(
    "coal:1:Coal"
    "raw_copper:2:Raw Copper"
    "raw_iron:3:Raw Iron"
    "redstone:3:Redstone"
    "quartz:2:Nether Quartz"
    "gold_nugget:1:Gold Nugget"
    "lapis_lazuli:4:Lapis Lazuli"
    "raw_gold:8:Raw Gold"
    "diamond:20:Diamond"
    "emerald:15:Emerald"
    "netherite_scrap:30:Netherite Scrap"
    "ancient_debris:50:Ancient Debris"
    "netherite_ingot:60:Netherite Ingot"
)

# Ores that need fewer than this many units to hit threshold
# will use exact per-unit checks. Others use the binary cascade
# (slightly approximate but far fewer commands).
INDIVIDUAL_CUTOFF=25

# ============================================================
# SCRIPT — do not edit below this line
# ============================================================

OUTPUT="functions/threat_check.mcfunction"
MAX_STACK=64

# Ceiling integer division: ceil(a/b)
ceil_div() { echo $(( ($1 + $2 - 1) / $2 )); }

# ---- Write file header ----
cat > "$OUTPUT" << 'HEADER'
# ============================================================
# threat_check.mcfunction
# AUTO-GENERATED — do not edit manually.
# Run generate_threat_check.sh to regenerate.
# ============================================================
# Runs once per second via threat_tick.
# Calculates each player's threat score from their inventory.
# Triggers mob spawn when score hits the threshold.

# ===== Debug confirmation (remove this line when done testing) =====
tellraw @a {"rawtext":[{"text":"§e[Threat Check] Running..."}]}

# ===== Tick down spawn cooldown (1 per second) =====
scoreboard players remove @a[scores={spawn_cooldown=1..}] spawn_cooldown 1

# ===== Reset threat for all players =====
scoreboard players set @a threat 0

HEADER

# ---- Write one section per ore ----
for ore_entry in "${ORES[@]}"; do
    IFS=':' read -r item value label <<< "$ore_entry"

    # How many units of this ore alone would hit the threshold?
    units_needed=$(ceil_div "$THRESHOLD" "$value")
    # Cap at max stack size
    max_units=$(( units_needed < MAX_STACK ? units_needed : MAX_STACK ))

    {
        echo "# ============================================================"
        echo "# $label  (value: $value per unit — $(ceil_div $THRESHOLD $value) units alone hit threshold)"
        echo "# ============================================================"

        if [ "$max_units" -le "$INDIVIDUAL_CUTOFF" ]; then
            # Exact: one command per unit up to max_units
            for (( q=1; q<=max_units; q++ )); do
                echo "execute as @a[hasitem={item=$item,quantity=${q}..}] run scoreboard players add @s threat $value"
            done
        else
            # Binary cascade: approximate but only 7 commands max
            # Quantities: 1, 2, 4, 8, 16, 32, 64
            # Amounts:    V, V, 2V, 4V, 8V, 16V, 32V
            qtys=(1 2 4 8 16 32 64)
            adds=($value $value $((value*2)) $((value*4)) $((value*8)) $((value*16)) $((value*32)))
            for i in "${!qtys[@]}"; do
                qty="${qtys[$i]}"
                add="${adds[$i]}"
                echo "execute as @a[hasitem={item=$item,quantity=${qty}..}] run scoreboard players add @s threat $add"
            done
        fi

        echo ""
    } >> "$OUTPUT"
done

# ---- Write trigger logic ----
cat >> "$OUTPUT" << FOOTER
# ============================================================
# TRIGGER — threshold $THRESHOLD, 3-second warning before mobs spawn
# ============================================================

# Step 1: Threshold hit, no cooldown, no spawn pending — start countdown and warn player
execute as @a[scores={threat=${THRESHOLD}..,spawn_cooldown=..0,spawn_timer=0}] run scoreboard players set @s spawn_timer 3
execute as @a[scores={spawn_timer=3}] run tellraw @s {"rawtext":[{"text":"§c§lYour ore haul has attracted dangerous creatures..."}]}

# Step 2: Countdown reaches 1 — spawn mobs
execute as @a[scores={spawn_timer=1}] at @s run function threat_spawn

# Step 3: Tick down the spawn timer each second
scoreboard players remove @a[scores={spawn_timer=1..}] spawn_timer 1
FOOTER

echo "Generated $OUTPUT (threshold: $THRESHOLD)"
echo "Ores included: ${#ORES[@]}"
