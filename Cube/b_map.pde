void drawMap() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldY = ground - blockSize, worldZ = 0;
  while (mapY < map.height) {
    color pixel = map.get(mapX, mapY);
    if (pixel == black) {
      worldX = mapX*blockSize*2;
      worldZ = mapY*blockSize*2;
      texturedBox(tblock, tblock, tblock, worldX, worldY, worldZ, blockSize);
    }
    
    mapX++;    
    if (mapX > map.width) {
      mapX = 0;
      mapY++;
    }    
  }

}
