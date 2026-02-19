import { world, system, ItemStack } from "@minecraft/server";

const CUSTOM_BLOCK_DROPS = {
  "minecraft:dirt": { item: "minecraft:diamond", minCount: 1, maxCount: 3 },
  "minecraft:stone": { item: "minecraft:diamond", minCount: 1, maxCount: 3 },
};

world.beforeEvents.playerBreakBlock.subscribe((event) => {
  const dropInfo = CUSTOM_BLOCK_DROPS[event.block.typeId];
  if (!dropInfo) return;

  event.cancel = true;

  const { x, y, z } = event.block.location;
  const dimensionId = event.dimension.id;

  system.run(() => {
    const dimension = world.getDimension(dimensionId);
    dimension.runCommand(`setblock ${x} ${y} ${z} air`);

    const count =
      Math.floor(Math.random() * (dropInfo.maxCount - dropInfo.minCount + 1)) +
      dropInfo.minCount;
    dimension.spawnItem(new ItemStack(dropInfo.item, count), {
      x: x + 0.5,
      y: y + 0.5,
      z: z + 0.5,
    });
  });
});
