void drawMap() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldY = ground - blockSize, worldZ = 0;
  while (mapY < map3.height) {
    color pixel = map3.get(mapX, mapY);
    if (pixel != white) {
      worldX = mapX*blockSize*2;
      worldZ = mapY*blockSize*2;
      texturedBox(pixel, worldX, worldY, worldZ, blockSize);
    } 
    
    mapX++;    
    if (mapX > map3.width) {
      mapX = 0;
      mapY++;
    }    
  }
 
  
}
