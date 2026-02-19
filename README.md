# MinecraftBedrockServerSetup
This repo is for the purpose of maintaining the state of a Minecraft Bedrock server setup

## Where should you put this file in Windows
this file can be tricky since you need to have it inside of the behavioral packs area. the location I found to be useful was 
C:\Users\<Username>\AppData\Roaming\Minecraft Bedrock\Users\Shared\games\com.mojang>

## Loot Tables

Loot tables are located in `loot_tables/blocks/` and override what blocks drop when broken.

### Testing Loot Tables

You can verify a loot table is loaded by using the `/loot` command in-game. The path format uses the relative path without the `loot_tables/` prefix or `.json` extension:

```
/loot give @s loot "blocks/dirt"
/loot give @s loot "blocks/stone"
```

If the loot table is working, you should receive the items defined in the loot table (e.g. diamonds).

To test that blocks actually drop the custom loot, simply break the block in survival mode and check what drops.